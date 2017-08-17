function install_rvm {
  echo "===> Installing RVM >>"
  #curl -sSL https://get.rvm.io | bash
  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import
  curl -L https://get.rvm.io | bash -s stable --ruby
  
  #Reload shell
  . ~/.rvm/scripts/rvm

  result=`type rvm | head -1`
  echo "===> Result of testing RVM : '$result'"
  if [ "$result" == "rvm is a function" ]; then
    echo '===> RVM system install successful.'
  else
    echo '===> Error - Installation not successful, RVM should be a function not a binary - See https://rvm.io/rvm for more info'
    return
  fi

  . "$HOME/.rvmrc"
  . ~/.rvm/scripts/rvm

  echo '===> Installing Ruby 2.4.1'
  rvm install 2.4.1

  echo '===> Setting default to 2.4.1'
  rvm --default use 2.4.1


  current_user=`whoami`
  echo "===> Fixing permissions and ensuring $current_user has access"
  chown -R $current_user ~/.rvm

  profile_location=$HOME/.bash_profile

  #Add to bash_profile
  #TODO : Can only use this when this function (and related like bash_profile_location) is in a seperate script

  # if ! grep -q '### Load RVM into a shell session' "${profile_location}" ; then
  #   echo "Editing ${profile_location} to load RVM on Terminal launch"
  #   echo  '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  ### Load RVM into a shell session' >> "${profile_location}"
  # fi

  #Reload shell
  source $profile_location
}    

install_rvm
