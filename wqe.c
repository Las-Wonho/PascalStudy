#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define lli long long int
#define ret cache[idx][pr][s1][s2]

char str[71];
int n, arr[71];
lli cache[71][10][2][2];

int Check()
{
    int inc = 1;
    for (int i = 1; i < n; i++)
    {
        if (arr[i - 1] < arr[i])
        {
            if (!inc)
                return 0;
        }
        else if (arr[i - 1] > arr[i])
        {
            inc = 0;
        }
    }
    return 1;
}

lli count(int idx, int pr, int s1, int s2)
{
    if (idx == n)
        return s1;
    if (ret != -1)
        return ret;
    ret = 0;

    if (s1)
    {
        for (int i = 0; i < 10; i++)
        {
            if (!s2)
            {
                if (pr <= i)
                    ret += count(idx + 1, i, s1, 0);
                else
                    ret+= count(idx + 1, i, s1, 1);
            }
            else
            {
                if (pr >= i)
                    ret += count(idx + 1, i, s1, 1);
            }
        }
    }
    else
    {
        for (int i = 0; i <= arr[idx]; i++)
        {
            if (!s2)
            {
                if (pr <= i)
                    ret += count(idx + 1, i, i < arr[idx], 0);
                else
                    ret += count(idx + 1, i, i < arr[idx], 1);
            }
            else
            {
                if (pr >= i)
                    ret += count(idx + 1, i, i < arr[idx], 1);
            }
        }
    }
    return ret;
}
int main()
{
    int TESTCASE;
    scanf("%d", &TESTCASE);
    while (TESTCASE--)
    {
        scanf("%s", str);
        n = strlen(str);
        for (int i = 0; i < n; i++)
            arr[i] = str[i] - '0';
        if (!Check())
        {
            puts("-1");
            continue;
        }
        for (int i = 0; i <= n; i++)
        {
            for (int t = 0; t < 10; t++)
            {
                cache[i][t][0][0] = -1;
                cache[i][t][0][1] = -1;
                cache[i][t][1][0] = -1;
                cache[i][t][1][1] = -1;
            }
        }
        printf("%lld\n", count(0, 0, 0, 0));
    }
    return 0;
}