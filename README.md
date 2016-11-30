# STM32 Development Environment

This image provides a development environment to build software for the [STM32 microcontroller family][1].

It contains the [open source version of the STMicroelectronics ST-LINK tools][2].

## How to

To compile a project using a Makefile :

    docker run --rm -v <local path>:/home/dev/app docker.io/skyplabs/stm32

*local path* refers to the folder on your host system which holds the source code of your application and containing a Makefile.

To get into the container and then get access to the ST tools :

    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v <local path>:/home/dev/app docker.io/skyplabs/stm32 /bin/bash

## Troubleshooting

### *unknown chip id! 0xe0042000*

* Short-circuit the two pins marked 'BOOT0' and 'VDD'
* Reset the board
* Erase the flash memory

        st-flash erase

## License

[MIT][3]

 [1]: http://www.st.com/web/en/catalog/mmc/FM141/SC1169
 [2]: https://github.com/texane/stlink
 [3]: http://opensource.org/licenses/MIT
