# Rockchip RK3566 quad core 2GB RAM, eMMC, Gigabit Ethernet, Wi-Fi, Bluetooth, HDMI
BOARD_NAME="LD1001"
BOARD_VENDOR="linxdot"
BOARDFAMILY="rockchip64"
BOARD_MAINTAINER=""
BOOTCONFIG="linxdot-ld1001-rk3566_defconfig"
BOOT_SOC="rk3566"
KERNEL_TARGET="current"
BOOT_FDT_FILE="rockchip/rk3566-linxdot-ld1001.dtb"
SERIALCON="ttyS2:1500000"
IMAGE_PARTITION_TABLE="gpt"

function post_family_config__linxdot_ld1001_use_mainline_uboot() {
	declare -g BOOTSOURCE="https://github.com/u-boot/u-boot.git"
	declare -g BOOTBRANCH="tag:v2025.04"
	declare -g BOOTPATCHDIR="v2025.04"
	declare -g BOOTDELAY=3
	declare -g UBOOT_TARGET_MAP="BL31=${RKBIN_DIR}/${BL31_BLOB} ROCKCHIP_TPL=${RKBIN_DIR}/${DDR_BLOB};;u-boot-rockchip.bin"

	unset uboot_custom_postprocess write_uboot_platform write_uboot_platform_mtd

	function write_uboot_platform() {
		dd "if=$1/u-boot-rockchip.bin" "of=$2" bs=32k seek=1 conv=notrunc status=none
	}
}
