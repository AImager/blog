---
layout: wiki
tags: []
---

## 用途

动态操作Java字节码

## 实例

```java
public void makeclass(String className,String methodName, CONSTANTS.INVOKETYPE invoketype,String interfaceCode) throws NotFoundException, CannotCompileException, IOException {
        ClassPool pool = ClassPool.getDefault();
        CtClass clazz = pool.makeClass(className);
        ClassFile ccFile = clazz.getClassFile();
        ConstPool constpool = ccFile.getConstPool();

        CtClass executor = pool.get("com.javassist.test.Executor");
        CtClass requst = pool.get("javax.servlet.http.HttpServletRequest");
        CtClass response = pool.get("javax.servlet.http.HttpServletResponse");

        String fieldName = invoketype.getValue());
        // 增加字段
        CtField field = new CtField(executor,fieldName,clazz);
        field.setModifiers(Modifier.PUBLIC);
        FieldInfo fieldInfo = field.getFieldInfo();

        // 属性附上注解
        AnnotationsAttribute fieldAttr = new AnnotationsAttribute(constpool, AnnotationsAttribute.visibleTag);
        Annotation autowired = new Annotation("org.springframework.beans.factory.annotation.Autowired",constpool);
        fieldAttr.addAnnotation(autowired);
        fieldInfo.addAttribute(fieldAttr);
        clazz.addField(field);

        // 增加方法，javassist可以直接将字符串set到方法体中，所以使用时非常方便
        CtMethod method = new CtMethod(new CtClassType(CtClass.javaLangObject,pool),methodName,new CtClass[]{requst,response},clazz);
        method.setModifiers(java.lang.reflect.Modifier.PUBLIC);
        StringBuffer methodBody = new StringBuffer();
        methodBody.append("{return "+fieldName+".execute(\""+interfaceCode+"\",(com.javassist.test.RequestVo)$1.getAttribute(\"request\"));}");
        method.setBody(methodBody.toString());

        // 类附上注解
        AnnotationsAttribute classAttr = new AnnotationsAttribute(constpool, AnnotationsAttribute.visibleTag);
        Annotation controller = new Annotation("org.springframework.stereotype.Controller",constpool);
        Annotation requestMapping = new Annotation("org.springframework.web.bind.annotation.RequestMapping.RequestMapping",constpool);
        String visitPath = "/api/department";
        requestMapping.addMemberValue("value",new StringMemberValue(visitPath,constpool));
        classAttr.addAnnotation(controller);
        classAttr.addAnnotation(requestMapping);
        ccFile.addAttribute(classAttr);

        //方法附上注解
        AnnotationsAttribute methodAttr = new AnnotationsAttribute(constpool, AnnotationsAttribute.visibleTag);
        //Annotation annotation3 = new Annotation("org.springframework.web.bind.annotation.RequestMapping.RequestMapping",constpool);
        requestMapping.addMemberValue("value",new StringMemberValue("/register",constpool));

        Annotation responseBody = new Annotation("org.springframework.web.bind.annotation.RequestMapping.ResponseBody",constpool);
        methodAttr.addAnnotation(requestMapping);
        methodAttr.addAnnotation(responseBody);
        MethodInfo info = method.getMethodInfo();
        info.addAttribute(methodAttr);
        clazz.addMethod(method);
        clazz.writeFile();
}
```

## 参考链接

* [javassist使用全解析](https://www.cnblogs.com/rickiyang/p/11336268.html)
