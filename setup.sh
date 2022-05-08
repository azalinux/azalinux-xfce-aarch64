    
#!/bin/bash -x
set -e
set -u

    ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
    #hwclock --systohc

    sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

    locale-gen

    # nano/etc/locale.conf
    echo -n "LANG=en_US.UTF-8" >> /etc/locale.conf

# nano /etc/hostname
    echo "azalinux_aarch64" >> /etc/hostname

# nano /etc/hosts
    echo -n "127.0.0.1 localhost" >> /etc/hosts
    echo -n "::1       localhost" >> /etc/hosts
    echo -n "127.0.1.1 myhostname.localdomain myhostname" >> /etc/hosts
    
    useradd -m aza
    passwd aza
    usermod -aG wheel,audio,video,optical,storage,sys aza
    pacman -S --noconfirm --needed xdg-user-dirs
    
    pacman -S --noconfirm --needed vi
    pacman -S --noconfirm --needed vim

# visudo [uncomment "Wheel root access"] (to save type: :wq )
    echo " visudo is about to run - uncomment the 'wheel root access' then type ':wq' to save and exit :)"
    sleep 3
    visudo
    
    pacman -S --noconfirm --needed networkmanager
    systemctl enable NetworkManager
    
    exit

