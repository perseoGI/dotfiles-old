#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <linux/hidraw.h>
#include <fcntl.h>
#include <unistd.h>
#include <inttypes.h>

/* C */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>

uint8_t get_battery_level();

char *device = "/dev/hidraw1";
int main () {
	uint8_t current_battery_level;
	fflush(stdout);
	current_battery_level = get_battery_level();
	printf("%d\n", current_battery_level);


	/*char request_battery_packet [64] = {0xff, 0x09, 0x00, 0xfd, 0x04, 0x00, 0xf1, 0x05, 0x81, 0x74, 0xb4, 0x01};*/
	/*char receive_battery_packet [64] = {0};*/
	/*size_t request_size = sizeof(request_battery_packet);*/
	/*char *device = "/dev/hidraw1";*/
	/*int res;*/

	/*int fd = open(device, O_RDWR|O_NONBLOCK);*/
	/*if (fd < 0){*/
	/*perror("open");*/
	/*return 1;*/
	/*}*/


	/*[> Set Feature <]*/
	/*res = ioctl(fd, HIDIOCSFEATURE(64), request_battery_packet);*/
	/*if (res < 0)*/
	/*perror("HIDIOCSFEATURE");*/
	/*else*/
	/*printf("ioctl HIDIOCSFEATURE returned: %d\n", res);*/

	/*[> Get Feature <]*/
	/*receive_battery_packet[0] = 0xff;*/
	/*res = ioctl(fd, HIDIOCGFEATURE(64), receive_battery_packet);*/
	/*if (res < 0) {*/
	/*perror("HIDIOCGFEATURE");*/
	/*} else {*/
	/*printf("ioctl HIDIOCGFEATURE returned: %d\n", res);*/
	/*printf("Report data:\n\t");*/
	/*for (int i = 0; i < res; i++)*/
	/*printf("%hhx ", receive_battery_packet[i]);*/
	/*puts("\n");*/
	/*}*/

}

uint8_t get_battery_level() {
	char request_battery_packet[28] = { 0x21, 0xff, 0x05 };
	char request_battery_response[20];

	int fd = open(device, O_RDWR);
	if (fd < 0) {
		perror("open");
		return 1;
	}

	if (write(fd, request_battery_packet, sizeof(request_battery_packet)) < 0) {
		perror("write");
	}

	if (read(fd, request_battery_response, sizeof(request_battery_response)) < 0) {
		perror("read");
	}


	uint16_t battery_raw = (request_battery_response[3] << 8 ) + request_battery_response[4];
	uint8_t battery_level = (-138940 + 40 * battery_raw) / 291;
	/*printf("\nraw: %d\n reponse[3-4]: %hhx %hhx\nBattery level: %d\n", battery_raw, request_battery_response[3], request_battery_response[4], battery_level);*/
	/*printf("%d\n", battery_level);*/

	return battery_level;
}
