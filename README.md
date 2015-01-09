# ikeaV1V2 
架设ikeaV1和V2 脚本 

支持设备 :  
mac : Cicso Ipsec  
ios : Cicso Ipsec ; ikeaV1 ; ikeaV2  
win7 : ikeaV1  
win8 : ikeaV1 ; ikeaV2  
android : Cicso Ipsec  

支持认证方法:
用户名,密码,共享密钥
用户名,密码,证书 (还没研究好)

用法:

1.  setup.sh 安装strongswan
2.  key.sh 生成证书,并且复制到相关目录下  
    其中,改所有"vpn.domain.com"为自己的域名
3.  修改配置文件,复制到相关目录中
4.  设置nat转发
5.  启动 ipsec start  
  
```
/etc/strongswan.conf
设置拨号之后下发的dns
```

```
/etc/ipsec.conf
主要设置rightsourceip, 拨号后分配的IP,需要做转发
```

```
/etc/ipsec.secrets
主要设置账号,密码,共享密钥
```


