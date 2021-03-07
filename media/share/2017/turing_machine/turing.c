#include <stdio.h>
#include <stdlib.h>

#define SIZE 1000

struct tuple {
    int status;     //当前状态
    int read;       //读取值，0或者1
    int write;      //写值，0或者1
    int oper;       //下一步操作，0后移，1前移，2停止
    int next_status;    //下个状态
    struct tuple *next_tuple;   //下一个元祖程序
};

void set_program(struct tuple * program, char * str) {
    int arr[5], index = 0;
    char dest[SIZE];
    int start = 0, len = strlen(str);
    for(int i=0; i <= len; i++) {
        if(str[i] == ',' || i == len) {
            strncpy(dest, &str[start], i - start);
            start = i+1;
            dest[i - start] = '\0';
            arr[index] = atoi(dest);
            index++;
        }
    }
    program->status = arr[0];
    program->read = arr[1];
    program->write = arr[2];
    program->oper = arr[3];
    program->next_status = arr[4];
    program->next_tuple = NULL;
}

void turing_machine (struct tuple * program_head, char * paper_tape, int init_status) {
    struct tuple * current_head = program_head;
    int current_status = init_status;
    int index = 0;
    while(1) {
        if(current_head->status == current_status && current_head->read == (int)(paper_tape[index] - '0')) {
            paper_tape[index] = (char)(current_head->write + '0');
            if(current_head->oper == 0) {
                index++;
            } else if(current_head->oper == 1) {
                index--;
            } else {
                break;
            }
            current_status = current_head->next_status;
            current_head = program_head;
        } else {
            current_head = current_head->next_tuple;
        }
    }
} 

int main () {
    char str[SIZE];
    char paper_tape[SIZE];
    struct tuple * program_head;
    struct tuple * current_head;
    FILE * file_program = fopen("turing_program", "r");
    FILE * file_paper = fopen("paper_tape", "r");
    program_head = (struct tuple *)malloc(sizeof(struct tuple));
    current_head = program_head;
    while(fgets(str, SIZE, file_program)) {
        set_program(current_head, str);
        current_head->next_tuple = (struct tuple *)malloc(sizeof(struct tuple));
        current_head = current_head->next_tuple;
    }
    fgets(paper_tape, SIZE, file_paper);
    turing_machine(program_head, paper_tape, 1);
    FILE * output = fopen("output", "w");
    fwrite(paper_tape, sizeof(char), SIZE, output);
    fclose(output);
    fclose(file_program);
    fclose(file_paper);
    return 0;
}
