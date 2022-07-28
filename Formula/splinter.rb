class Splinter < Formula
    desc "Cross-platform and language indepedent db migration tool"
    homepage "https://github.com/squareboat/splinter#readme"
    url "https://github.com/squareboat/splinter/archive/refs/tags/v0.0.3.tar.gz"
    sha256 "22d225d2ec5b7a471ecdb775f161fcddc227c3966c00ef505f32ac2e20971648"
    license "MIT"
  
    depends_on "go" => :build
  
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