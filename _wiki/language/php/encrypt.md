---
layout: wiki
tags: [加密,rsa]
---

## 非对称加密

A、B之间通信，首先A、B各自生成自己的公匙、私匙，即 $A_{pri}, A_{pub}, B_{pri}, B_{pub}$ ，A要给B传递信息的时候，A使用 $B_{pub}$ 加密信息，然后B收到信息后使用 $B_{pri}$ 解密信息。这样解决了被窃听的问题。

A在传递信息给B前，先对信息使用 $A_{pri}$ 签名，然后把签名和信息一起加密发给B（也可以只对信息加密，然后与签名一起发送给B，虽然签名是单向的，无法解密查看信息，但我还是建议一起加密），B收到信息解密，得到签名和信息，最后使用 $A_{pub}$ 验证签名是否是对的。这样解决了冒充、篡改和丢失的问题。

下面为完整的非对称通信流程：

```php
$data = "这里是用于加密的数据";

$data_bad = "这里是篡改后的数据";

date_default_timezone_set("Asia/Shanghai");

/**
 * A生成自己的公私匙
 */
$res = openssl_pkey_new(array('private_key_bits' => 1024));
openssl_pkey_export($res,$pri);
$d= openssl_pkey_get_details($res);
$pub = $d['key'];

/**
 * B生成自己的公私匙
 */
$res_b = openssl_pkey_new(array('private_key_bits' => 1024));
openssl_pkey_export($res_b,$pri_b);
$d_b= openssl_pkey_get_details($res_b);
$pub_b = $d_b['key'];

/**
 * B获取密匙位数
 */
$keysize = openssl_pkey_get_details(openssl_pkey_get_public($pub_b))['bits']/8;
echo("密匙位数：\n" . $keysize . "\n");

/**
 * A的加密流程
 */
openssl_sign($data, $signature, $pri, OPENSSL_ALGO_SHA256);

$origin_data = json_encode([
    "sign" => base64_encode($signature),
    "data" => $data
]);
echo("加密前的数据：\n" . $origin_data . "\n");

$need_encrypt = $origin_data;
$encrypted_res = "";
while($need_encrypt){
  $input= substr($need_encrypt,0,$keysize-11);
  $need_encrypt=substr($need_encrypt,$keysize-11);
  openssl_public_encrypt($input, $encrypted, $pub_b);
  $encrypted_res.=$encrypted;       // $encrypted_res就是传输数据，打印一般都是乱码
}


/**
 *  B收到报文的解密流程
 */
$need_decrypt = $encrypted_res;
$decrypt_res = "";
while($need_decrypt){
  $input= substr($need_decrypt,0,$keysize);
  $need_decrypt=substr($need_decrypt,$keysize);
  openssl_private_decrypt($input,$out,$pri_b);
  $decrypt_res.=$out;       // $decrypt_res就是解密后的结果
}
echo("解密后的数据：\n" . $decrypt_res . "\n");

$decrypt_array = json_decode($decrypt_res, true);
$signature_dec = base64_decode($decrypt_array['sign']);
$data_dec = $decrypt_array['data'];

if(openssl_verify($data_dec, $signature_dec, $pub, OPENSSL_ALGO_SHA256)) {
    echo("信息正确，信息如下：\n" . $data_dec . "\n");
} else {
    echo("信息被篡改\n");
}

```