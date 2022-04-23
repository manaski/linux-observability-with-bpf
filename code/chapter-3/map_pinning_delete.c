//
// Created by lifan on 2022/4/21.
//

#include <errno.h>
#include <linux/bpf.h>
#include <stdio.h>
#include <string.h>
#include "bpf.h"

// element cannot be deleted from ARRAY map
static const char *file_path = "/sys/fs/bpf/my_map";

int main(int argc, char **argv) {
    int fd, key, result;

    fd = bpf_obj_get(file_path);
    if (fd < 0) {
        printf("Failed to fetch the map: %d (%s)\n", fd, strerror(errno));
        return -1;
    }

    key = 1;
    result = bpf_map_delete_elem(fd, &key);
    if (result == 0) {
        printf("Element deleted from the map \n");
        return -1;
    } else {
        printf("Failed to delete element from the map: %d (%s)\n", result, strerror(errno));
    }

    return 0;
}
