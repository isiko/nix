{pkgs, config, ...}:

{
    programs.wofi = {
        enable = true;
        style = ''
            /* Theme by isiko404
             * BG Dark: #201E1F
             * BG Accent: #2E86AB
             * Text Light: #cdd6f4
             * Text Dark: #313244
             */
            
            * {
                font-family: "Caskaydia Cove Nerd Font";
                font-weight: bold;
                font-size: 12px;
                color: white;
            }
            
            window {
                background: rgba(17, 17, 27, 0.0);
                border-radius: 10px;
                filter: blur(10px);
            }
            
            #inner-box {
            }
            
            #input {
                background: #FF8811;
                color: white;
            }
            
            /* search + clear Icon icon */
            #input, #input:first-child > :nth-child(1), #input:first-child > :nth-child(4) {
              color: white;
              padding: 5px 5px 5px 5px;
              width: 24px;
              height:24px;
            }
            
            #input {
              font-size: 24px;
              padding: 10px 10px;
              margin: 5px 3px;
            }
            
            #entry {
                background: #040F0F;
                color: white;
            }
            
            #input, #entry {
                border: none;
                outline: none;
                outline-style: none;
                border-radius: 10px;
            }
            
            #entry {
                margin: 3px 20px;
                padding: 3px 5px;
            }
            
            #img {
                margin: 3px 3px;
            }
            
            
            #entry:selected {
                background: #2E86AB;
                animation: gradient_f 1s ease-in infinite;
                transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
            }
            
            #entry:selected label:nth-child(2) {
                outline: 0px;
                color: #313244;
                padding-left: 10px;
                padding-right: 10px;
                animation: gradient_f 1s ease-in infinite;
                transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
            }
        '';
    };
}
