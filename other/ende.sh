#!/bin/bash

# 加密函数
encrypt() {
  # 加密密钥
  local key="your_encryption_key"
  # 待加密字符串
  local plaintext="$1"

  # 使用 openssl 加密字符串
  local ciphertext=$(openssl enc -e -aes-256-cbc -pass pass:$key <<<"${plaintext}" | base64)

  # 返回加密结果
  echo "$ciphertext"
}

# 解密函数
decrypt() {
  # 解密密钥
  local key="your_encryption_key"
  # 待解密字符串
  local ciphertext="$1"

  # 使用 openssl 解密字符串
  local plaintext=$(echo "$ciphertext" | base64 -d | openssl enc -d -aes-256-cbc -pass pass:$key)

  # 返回解密结果
  echo "$plaintext"
}

# 处理命令行参数
case "$1" in
  en)
    # 加密数据
    encrypted_data=$(encrypt "$2")
    echo "加密后的数据：$encrypted_data"
    ;;
  de)
    # 解密数据
    decrypted_data=$(decrypt "$2")
    echo "解密后的数据：$decrypted_data"
    ;;
  *)
    # 输出帮助信息
    echo "Usage: $0 en decrypted_data"
    echo "       $0 de encrypted_data"
    exit 1
    ;;
esac
