# STM32 Development Environment

This image provides a development environment to build software for the [STM32 microcontroller family][1].

## How to

To compile a project using a Makefile :

    docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v <local path>:/home/dev/app stm32f4-dev

*local path* refers to the folder on your host system which holds the source code of your application and containing a Makefile.

## Troubleshooting

### *unknown chip id! 0xe0042000*

* Short-circuit the two pins marked 'BOOT0' and 'VDD'
* Reset the board
* Erase the flash memory

        st-flash erase

## License

[MIT][2]

 [1]: http://www.st.com/web/en/catalog/mmc/FM141/SC1169
 [2]: http://opensource.org/licenses/MIT
