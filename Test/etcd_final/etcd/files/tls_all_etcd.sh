{
ETCD1_IP="10.0.4.30"
ETCD2_IP="10.0.5.57"
ETCD3_IP="10.0.6.65"
HA_PROXY1="10.0.1.161"
HA_PROXY2="10.0.2.174"
cat > etcd-csr.json <<EOF
{
  "CN": "etcd",
  "hosts": [
    "localhost",
    "127.0.0.1",
    "${ETCD1_IP}",
    "${ETCD2_IP}",
    "${ETCD3_IP}",
    "${HA_PROXY1}",
    "${HA_PROXY2}"
  ], 
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "BravVox",
      "L": "USA",
      "O": "K8Staging",
      "OU": "ETCD-CA",
      "ST": "Tennessee"
    }
  ]
}
EOF
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=etcd etcd-csr.json | cfssljson -bare etcd
}
