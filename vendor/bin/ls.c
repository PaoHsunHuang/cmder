#include<dirent.h>
#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<unistd.h>
size_t Size = 256;

int main(int argc, char* argv[]) {
    char CurrentDir[Size];
    getcwd(CurrentDir, Size);
    int count = 0;
    DIR *mydir;
    struct dirent* dp;
    struct stat fileInfo;
    mydir = opendir(CurrentDir);

    // if argc > 1, have flag
    // check what flag it is choose different way to output
    if (argc > 1) {
        char* flag;
        flag = argv[1];

        // flag == -d
        // only output directory
        if (strcmp(flag,"-d") == 0 ) {
            printf("this is search dir\n");

            while((dp = readdir(mydir)) != NULL) {
                stat(dp->d_name, &fileInfo);
                if (S_ISDIR(fileInfo.st_mode)) {
                    printf("%s/ ", dp->d_name);
                }
                count ++;
            }

            // if no file is match
            // give messeage
            if (count == 0) {
                printf("didn't find any directory\n");
            }


        // flag == -f
        // output the name that match
        // also use for -t, find txt file
        } else if (strcmp(flag,"-f") == 0){
            char* matchWord;
            matchWord = argv[2];

            while((dp = readdir(mydir)) != NULL) {
                if (strstr(dp->d_name , matchWord) != NULL) {
                    printf("%s  \n", dp->d_name);
                    count++;
                }
            }


            // if no file is match
            // give messeage
            if (count == 0) {
                printf("didn't find any file match %s\n", matchWord);
            }

        // shouldn't happen,
        // just in case
        } else {
            printf("unknown flag\nlib_allen /? for more information\n");
        }

    //no flag, print out every file
    } else {
        while((dp = readdir(mydir)) != NULL) {
            printf("%s \n", dp->d_name);
        }
    }

    closedir(mydir);
    return 0;
}
