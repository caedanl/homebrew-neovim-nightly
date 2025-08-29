cask 'neovim-nightly' do
  version :latest
  sha256 :no_check

  arch arm: 'arm64'
  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz",
      verified: 'github.com/neovim'

  name 'Neovim Nightly'
  homepage 'https://neovim.io/'

  binary "nvim-macos-#{arch}/bin/nvim", target: 'nvim-nightly'

  postflight do
    system_command 'xattr', args: ['-cr', staged_path.to_s]
  end
end
