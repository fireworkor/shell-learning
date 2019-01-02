#!/bin/bash
#1，挂载光盘    
	mkdir /mnt/cdrom
	mount  /dev/cdrom  /mnt/cdrom
#卸载挂载用
#umount /mnt/cdrom

#2，让网络yum源文件失效
	cd /etc/yum.repos.d/
#重命名所有的.repo文件
	rename  .repo  .repo.bak  *  
#配置一个.repo文件
	cp  CentOS-Media.repo.bak  CentOS-Media.repo    
#3，修改光盘yum源文件
    vi CentOS-Media.repo 

#[c6-media]
#name=CentOS-$releasever - Media
#baseurl=file:///mnt/cdrom        
#这里的地址为自己光盘挂载地址，并把不存在的地址注释掉，在行首注释
# file:///media/cdrom/
# file:///media/cdrecorder/
#gpgcheck=1
#enabled=1        
#把原来的0改为1，让这个yum源配资文件生效
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

#可使用 yum repolist 查看 当前可用yum源
yum clean all
yum repolist



#让修改的配置重启后生效：修改配置文件/etc/fstab
	cp /etc/fstab /etc/fstab.bak
#添加一行记录：
	echo "/dev/sr0  /mnt/cdrom/ iso9660 ro 0 0" >> /etc/fstab.bak
#防止多次执行shell
	chmod 444 ~/mysh/setCDyum.sh
	


