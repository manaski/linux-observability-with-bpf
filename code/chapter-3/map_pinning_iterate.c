//
// Created by lifan on 2022/4/21.
//

#include <errno.h>
#include <linux/bpf.h>
#include <stdio.h>
#include <string.h>
#include "bpf.h"

static const char *file_path = "/sys/fs/bpf/my_map";

int main(int argc, char **argv) {
    int fd, next_key, lookup_key, value;

    fd = bpf_obj_get(file_path);
    if (fd < 0) {
        printf("Failed to fetch the map: %d (%s)\n", fd, strerror(errno));
        return -1;
    }

    lookup_key = -1;
    while (bpf_map_get_next_key(fd, &lookup_key, &next_key) == 0) {
        printf("The next key in map is '%d'\n", next_key);
        if (bpf_map_lookup_elem(fd, &next_key, &value) == 0) {
            printf("The next value in map is '%d'\n", value);
        } else {
            printf("Failed to get next value from map");
        }

        lookup_key = next_key;
    }

    return 0;
}
