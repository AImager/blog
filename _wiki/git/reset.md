reset：回到某状态
    --hard <commit_id>：所有信息回退到commit_id级别，commit_id是提交的commit的哈希值
    --soft <commit_id>：保留工作区源码和暂存区信息，但回退本地仓库到commit_id级别
    --mixed <commit_id>：不加参数的默认版本，保留工作区源码，但回退暂存区和本地仓库到commit_id级别