# TODO: Write documentation for `Namecompat`
module NameCompat
  VERSION = "0.1.0"

  class NameFixer
    WINVALID_CHARS = ["]",">","<",":","\"","/","\\","|","?","*"]
    WINVALID_NAMES = %(CON PRN AUX NUL COM1 COM2 COM3 COM4 COM5 COM6 COM7 COM8 COM9 LPT1 LPT2 LPT3 LPT4 LPT5 LPT6 LPT7 LPT8 LPT9)

    @filename : String
    @default : Char

    def initialize(filename, default)
      @filename = filename
      @default = default
    end

    def fix
      puts "hello world"
    end
  end

  class CLI

    @filename : String
    @default_character : Char

    def initialize
      @filename = "FILENAME UNSET"
      @default_character = '_'
      @env = ENV
    end

    # TODO: Handle arguments more robustly
    def set_options(env, argv) #(@env : Module, argv)
      if argv.first == "-c"
        @default_character = argv[1][0]
      end

      @filename = argv.last
      @env = env
      self
    end

    def run
      NameFixer.new(@filename, @default_character).fix
    end
  end
end

NameCompat::CLI.new.set_options(ENV, ARGV).run
