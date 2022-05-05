{
cat > ca-config.json <<EOF
{
    "signing": {
        "default": {
            "expiry": "8760h"
        },
        "profiles": {
            "etcd": {
                "expiry": "8760h",
                "usages": ["signing","key encipherment","server auth","client auth"]
            }
        }
    }
}
EOF
cat > ca-csr.json <<EOF
{
  "CN": "etcd cluster",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "BrovVox",
      "L": "USA",
      "O": "k8Staging",
      "OU": "ETCD-CA",
      "ST": "Tennessee"
    }
  ]
}
EOF
cfssl gencert -initca ca-csr.json | cfssljson -bare ca
}
