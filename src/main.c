#include "raylib.h"

#include "init.h"
#include "draw.h"
#include "clean.h"

int main(void)
{
        init();

        while (!interrupted && !WindowShouldClose())
        {
                draw();
        }

        clean();

        return 0;
}

