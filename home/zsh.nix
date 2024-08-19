{ pkgs , lib , ...}:
{
  enable = true;
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./p10k-config;
      file = "p10k.zsh";
    }
  ];
  shellAliases = {
      hupdate = "home-manager switch";
      ls = "exa";
      cat = "bat";
      cd = "cs";
      toolchain = "cd ~/epita/toolchain/toolchain";
      gitlab = "cd ~/epita/gitlab-manager/terraform"; 
  };

  enableAutosuggestions = true;
  enableCompletion = true;

  oh-my-zsh = {
    enable = true;
    #theme = "powerlevel10k";	
    plugins = [
      	"git"
    ];
  };


  initExtra = ''
  # Reeavaluate p10k config
  [[ ! -f ~/.config/home-manager/home/p10k-config/p10k.zsh ]] || source ~/.config/home-manager/home/p10k-config/p10k.zsh

  eval "$(direnv hook zsh)"
  eval $(thefuck --alias)

  bindkey '^ ' autosuggest-accept
  export PGDATA="$HOME/postgres_data"
  export PGHOST="/tmp"
  export DIRENV_LOG_FORMAT=""
  function cs () {
      cd "$@" && exa -a
  }

  setopt auto_cd
  cdpath=($HOME)
  '';
}
