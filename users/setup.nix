{ config, pkgs, home-manager, ... }:

{
  # Users
  users.users.isiko404 = {
    isNormalUser = true;
    description = "Isaak";
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "audio"
      "pipewire"
      "adbusers"
      "docker"
      "storage"
     ];
     shell = pkgs.zsh;
     packages = with pkgs; [];
     openssh.authorizedKeys.keys = [
        # (General) Yubikey
        "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBNyLjq9iwtiXEsgw1WyYItkmrCRsggAqWy4/KT6Z5kcLQSXAn/zZKmDSoOx5vqYmb3ZAzk1EywXcm+/PioEiqUkAAAAEc3NoOg== isiko404@laptop"
        
        # (General) No Yubikey
        #"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCnk50FiL8JUv1mRyXZHRyjc++MSO4KigKnCwudiIiw8ZpdYStPITCSfllTo8XKISd3lG9czXTvuBLsYIfLnXFJ1JXFfsFOGSHHSjXhA81jxIAQt0M9ngokjk3dsxLywc0ik+fmhlwt0YNihYkGUMo9uhwIGc4zTen6NxGqGfB0+lKRuQmdSsOV/n+0jK/WoHmSZHPTFZnwYg86GmfgzIEhI53aBVdMRo/8VtVQFd5CkgpEjoMMi5e0InuItIN42fRmj5f2xCIEmoSCl+hQ0X71ejkfpSGLDc8gv1iKm6mo2I5cbzltyPJWJEm8gRdoGatNvmhrterqNZ1ABd84GaZkc7shhitjHcynQcTXdv/AD7yuuLopfeFa61O8eECz1TBYpGf945H+V1Hggm+pu+ExHRXcUIM9xYVcMoxu4AnEGH6t0p+11b4OWPVfP7fdKeNV76AvOkdmd4dsfUwlqfGYYKjQI7P0UFmgQU8XGVk+SfVBV3XFF2m0H/XCU0Fl+clcPiqQQSstS0GkCNo2IMw/nSiIxAW34Ht4zKFoSBmPLU4LYcyBjmjm2dpcZVaFMJtdWtSaqeSPHqAk+mcjWQUEqxzDqyTvgE8fGaRWTsd0J0xztfGnBXEjwwtNXNP6Z1jU3xVjmUY1O/dEfYH0tlm5dH4bsBDy8FCfFcrD0m0wGw== isiko404@Laptop (isihd.ko@gmail.com) (G)"
        
        # Termius
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBOX1VQxSHQcfUsF+Zwp16D0lax7GB1wuTfVArNxbGOVOKjphLqmyvVGyWnXIKyFIDRH1LuTWvqnefUiP9aHP7I="
     ];
  };
  #services.getty.autologinUser = "isiko404";
}
