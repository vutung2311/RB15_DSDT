Firstly, change directory to acpica_dump and run command:
```
bash build_acpio_override.sh
```

Lastly, configure the bootloader to load your CPIO archive. For example, using Systemd-boot, /boot/loader/entries/arch.conf might look like this:

```
title	 Arch Linux
linux	 /vmlinuz-linux
initrd   /acpi_override.cpio
initrd	 /initramfs-linux.img
options  root=PARTUUID=ec9d5998-a9db-4bd8-8ea0-35a45df04701 resume=PARTUUID=58d0aa86-d39b-4fe1-81cf-45e7add275a0 ...
```
Now all that is left to do is to reboot and to verify the result.