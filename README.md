# Raw Image Builder
[![Join the chat at https://gitter.im/hypriot/talk](https://badges.gitter.im/hypriot/talk.svg)](https://gitter.im/hypriot/talk?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://circleci.com/gh/hypriot/image-builder-raw.svg?style=svg)](https://circleci.com/gh/hypriot/image-builder-raw)

This repo creates a number of blank images for a couple of ARM dev boards.
These images have the necessary partitions, sizes and filesystem - but not actual files.

Currently there is the following image:

* `rpi-raw-image` with two partitions (FAT + EXT4) for the Raspberry Pi
* `odroid-raw-image` with two partitions (FAT + EXT4) for ODROID (eg. XU4)

## Contributing

You can contribute to this repo by forking it and sending us pull requests. Feedback is always welcome!

You can build the root filesystem locally with Docker.

```bash
make rpi-raw-image
make odroid-raw-image
```

## Buy us a beer!

This FLOSS software is funded by donations only. Please support us to maintain and further improve it!

<a href="https://liberapay.com/Hypriot/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>


## License

MIT - see the [LICENSE](./LICENSE) file for details.
