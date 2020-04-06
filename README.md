# NameCompat: Filenames that work on Windows, Linux, and MacOS

This is a little program that you can run on Linux or MacOS to ensure that your filenames will be properly formed for other operating systems.

 - It tries to pick characters that are useful analogs for the ones being replaced.
 - The default character when there is no close analog is the underscore.
 - The default replacement character is configurable.
 - If multiple files would end up with the same name it differentiates them so you don't lose files. 

## Installation

If you're compiling it then use the `./build/release` script.

Otherwise just drop it in your `~/bin` or `/opt/local/bin`.

## Usage

`namecompat directory_or_filename`

Provide a directory and it will automatically apply to all files and subdirectories within it.
Otherwise it will just apply to the single file.

`namecompat -c - directory_or_filename`

Provide `-c` to specify the replacement character, in the example above it is `-`.

## Development

Write good code, build good features, ship it.

## Contributing

0. Accept the contributor agreement
1. Fork it (<https://github.com/acook/namecompat/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anthony Cook](https://github.com/acook) - creator and maintainer
