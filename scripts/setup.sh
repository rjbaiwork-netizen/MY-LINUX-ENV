#!/bin/bash

# সিস্টেম আপডেট করা
echo "🔄 Updating system packages..."
sudo apt update -y

# প্রয়োজনীয় টুলস ইনস্টল করা (যেমন: rclone, python, git, curl)
echo "📦 Installing essential tools..."
sudo apt install -y rclone git python3 python3-pip curl wget unzip

# অন্যান্য প্যাকেজ (প্রয়োজন হলে এখানে যোগ করুন)
# sudo apt install -y build-essential

# ভার্সন চেক করে নিশ্চিত হওয়া
echo "✅ Installed versions:"
rclone --version | head -n 1
python3 --version
git --version

echo "🚀 Linux Environment Setup Complete!"
