---
title: 参数校验
layout: post
tag: [validation,php]
---

对于PHP这种动态语言，我个人认为好的参数校验应该满足

* 尽量满足更多的参数类型校验，比如url、phone、passport等
* 尽量少的代码
* 尽可能清晰的表明代码含义，让开发人员扫过去就能明白有哪些参数，以及对这些参数的要求

从这些要求出发，我调研了laravel、phalcon、yii、thinkphp等框架以及一些开源项目，最后还是laravel的实现最为优雅，简单清晰。但如果不想用laravel，只想使用它的validation，也可以使用github上的一些抽离的版本，比如<https://github.com/overtrue/validation>或者<https://github.com/KennedyTedesco/Validation>，前者是中文开发，简单无依赖，但是基本没维护了；后者一直在更新，但是由于依赖多，所以用起来稍显麻烦。下面为overtrue的validation实例，其实不用讲解就能明白什么意思

```php
$factory = new ValidatorFactory(new Translator);

$rules = [
    'username' => 'required | min:5',
    'password' => 'confirmed',
];

$validator = $factory->make($input, $rules);

if (!$validator->passes()) {
    print_r($validator->messages()->all()); 
}
```

另外有一个开源[Validation](http://respect.github.io/Validation/)，其star数量达4.3k，完全使用面向对象的方式进行validation。但我觉得它太过繁杂了，在校验这个简单逻辑下，面向对象的优势完全体现不出来，所以不建议。