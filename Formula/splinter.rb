class Splinter < Formula
    desc "Cross-platform and language independent db migration tool"
    homepage "https://github.com/squareboat/splinter#readme"
    url "https://github.com/squareboat/splinter/archive/refs/tags/v0.0.4.tar.gz"
    sha256 "272271d380be0b01d6a209830d5a5fca80cc2a66df406a533bab99763be433be"
    license "MIT"
    
    depends_on "go" => :build

    bottle do
        root_url "https://github.com/the-e3n/homebrew-splinter/raw/main/Bottles"
        sha256 cellar: :any_skip_relocation, arm64_monterey: "9f9af0ba556eb4ba6c49bd7a4660f5022967dcf087968b19cd8e866c753c22ee"
    end
  
    def install
      print "Installing Splinter...\n"
      print "Version: #{version}\n"
      system "go", "build", "-o", "splinter"
      bin.install "splinter"
    end
  
    test do
      bin_file =File.exist?("#{bin}/splinter")
      assert bin_file, "Splinter binary not found"
      output = `#{bin}/splinter --help`
      return output.include? "migration"
    end
  end
