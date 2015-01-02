require "formula"

class BrewDepsGroup < Formula
    homepage "https://github.com/shulhi/homebrew-deps-group"
    url "https://github.com/shulhi/homebrew-deps-group.git"

    depends_on :python if MacOS.version <= :snow_leopard

    resource "networkx" do
        url "https://pypi.python.org/packages/source/n/networkx/networkx-1.9.1.tar.gz"
        sha1 "ac2db3b29c7c4d16435f2a7ebe90fc8bd687b59c"
    end

    skip_clean "bin"

    def install
        ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
        %w[networkx].each do |r|
            resource(r).stage do
                system "python", *Language::Python.setup_install_args(libexec/"vendor")
            end
        end

        # ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
        # system "python", *Language::Python.setup_install_args(libexec)

        bin.install Dir[libexec/"bin/*"]
        bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

        bin.install 'brew-deps-group.py'
        bin.install 'brew-deps-group.rb'
        (bin + 'brew-deps-group.py').chmod 0755
        (bin + 'brew-deps-group.rb').chmod 0755
    end
end