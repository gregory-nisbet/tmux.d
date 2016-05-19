#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <libgen.h>
#include <sys/utsname.h>
#include <stdbool.h>

static char *reattach_to_user_namespace = 
    "/usr/local/bin/reattach-to-user-namespace";

static char *tcsh = "tcsh";

bool is_darwin() {
    struct utsname u_container;
    uname(&u_container);

    return strcmp(u_container.sysname, "darwin");
}

int main(int argc, char **argv, char **envp)
{
    if (is_darwin()) {
        char *args[] = {reattach_to_user_namespace, "-l", tcsh, NULL};
        execve(tcsh, args, envp);
    } else {
        char *args[] = {tcsh, NULL};
        execve(tcsh, args, envp);
    }
}
