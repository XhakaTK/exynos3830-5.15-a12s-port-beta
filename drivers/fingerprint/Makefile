#
# Makefile for the Fingerprint sensor driver.
#

# Each configuration option enables a list of files.

ccflags-y := -Wformat

obj-$(CONFIG_SENSORS_FINGERPRINT)	+= fingerprint.o fingerprint_sysfs.o

fingerprint-$(CONFIG_SENSORS_FINGERPRINT)	+= fingerprint_common.o
fingerprint-$(CONFIG_SENSORS_FINGERPRINT_LSI)	+= fingerprint_common_lsi.o

fingerprint-$(CONFIG_SENSORS_ET5XX)		+= et5xx-spi.o et5xx-spi_data_transfer.o
