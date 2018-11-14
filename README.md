# STM32 Development Environment

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6902da542a5f4ea2b042255cff38c96a)](https://www.codacy.com/app/skyper/stm32-dockerfile?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=SkypLabs/stm32-dockerfile&amp;utm_campaign=Badge_Grade)

This image provides a development environment to build software for the [STM32 microcontroller family][stm32].

It contains the [open source version of the STMicroelectronics ST-LINK tools][stlink].

## How to

To compile a project using a `Makefile`:

    docker run --rm -v <local path>:/home/dev/app docker.io/skyplabs/stm32

*local path* refers to the folder on your host system which holds the source code of your application and containing a `Makefile`.

To get a shell to the container and then get access to the ST tools:

    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v <local path>:/home/dev/app docker.io/skyplabs/stm32 /bin/bash

## Troubleshooting

### *unknown chip id! 0xe0042000*

* Short-circuit the two pins marked 'BOOT0' and 'VDD'
* Reset the board
* Erase the flash memory

        st-flash erase

## License

[MIT][mit]

 [stm32]: https://www.st.com/en/microcontrollers/stm32-32-bit-arm-cortex-mcus.html
 [stlink]: https://github.com/texane/stlink
 [mit]: http://opensource.org/licenses/MIT
