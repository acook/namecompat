# TODO: Write documentation for `Namecompat`
module NameCompat
  VERSION = "0.1.0"

  class NameFixer
    WINVALID_CHARS = ["]",">","<",":","\"","/","\\","|","?","*"] + (0..31).map(&.unsafe_chr)
    WINVALID_NAMES = %w(CON PRN AUX NUL COM1 COM2 COM3 COM4 COM5 COM6 COM7 COM8 COM9 LPT1 LPT2 LPT3 LPT4 LPT5 LPT6 LPT7 LPT8 LPT9)

    @filename : String
    @default : Char

    def initialize(filename, default)
      @filename = filename
      @default = default
    end

    def fix
      puts "WINVALID_CHARS: #{WINVALID_CHARS}"
      puts "WINVALID_NAMES: #{WINVALID_NAMES}"

      # convert @filename to Path
      # if path directory, get files
      # check each filename vs names with and without ext
      # check each filename vs chars
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
      if argv.empty?
        usage "no options provided"
      end

      if argv.first == "-c"
        @default_character = argv[1][0]
      end

      @filename = argv.last
      @env = env
      self
    end

    def run
      if File.exists? @filename
        NameFixer.new(@filename, @default_character).fix
      else
        usage "File not found: #{@filename}", 2
      end
    end

    def usage(msg = "", code = 0, output = STDERR)
      if msg
        output.puts msg
        output.puts
        if code = 0
          code = 1
        end
      end

      output.puts "usage: namecompat file_or_directory"

      exit code
    end
  end
end

NameCompat::CLI.new.set_options(ENV, ARGV).run
