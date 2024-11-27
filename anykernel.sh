# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
do.devicecheck=1
do.supported.versions=1
do.version.sdk=1
do.build.id=1
do.supported.patchlevels=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
'; } # end properties

# shell variables
block=auto;
is_slot_device=auto;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
#example ramdisk set_perm_recursive
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
chmod -R 750 $home/ramdisk/*;
chown -R root:root $home/ramdisk*;
mount -o remount,rw /;
mount -o remount,rw /vendor;
mount -o remount,rw /system;
mount -o remount,rw /sbin;
mount -o remount,rw /data;
mount -o remount,rw /storage;

## AnyKernel install
dump_boot;

write_boot;
## end install
