require'dashboard'.setup({
  theme = 'doom',
  config = {
    header = {
"                                                                            ",
"                                                                            ",
"                                                                            ",
" ██████╗ ██╗   ██╗████████╗███████╗██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
"██╔═══██╗██║   ██║╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║",
"██║   ██║██║   ██║   ██║   █████╗  ██████╔╝██╔██╗ ██║██║   ██║██║██╔████╔██║",
"██║   ██║██║   ██║   ██║   ██╔══╝  ██╔══██╗██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
"╚██████╔╝╚██████╔╝   ██║   ███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
" ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
"                                                                            ",
"                           )               ,---.                            ",
"                          (                |. . |                           ",
"                          )               < .,.  >                          ",
"                         (  (              \\=__/                            ",
"                             )             ,'-'.                            ",
"                       (    (  ,,      _.__|/ /|                            ",
"                        ) /\\ -()------((_|___/ |                           ",
"                      (  // | (`'       ((  `'--|                           ",
'                _ -.;_/ \\--._          \\\\ \\-._/.                         ',
"              (_;-// | \\ \\-'.\\       <_,\\_\\`--'|                       ",
"                  ( `.__ _  ___,')         <_,-'__,'                          ",
"                   `'(_ )_)(_)_)'                                              ",
"                                                                            ",
"                                                                            "

    }, --your header
    center = {
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'f',
        --keymap = 'SPC f f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope find_files'
      },
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'Recently Opened Files',
        desc_hl = 'String',
        key = 'o',
        --keymap = 'SPC f d',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope oldfiles'
      },
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'See Commits',
        desc_hl = 'String',
        key = 'c',
        --keymap = 'SPC f d',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope git_commits'
      },
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'See Branches',
        desc_hl = 'String',
        key = 'b',
        --keymap = 'SPC f d',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope git_branch'
      },
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'See Git Status',
        desc_hl = 'String',
        key = 'g',
        --keymap = 'SPC f d',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope git_status'
      },
      {
        icon = '   ',
        icon_hl = 'Title',
        desc = 'Change Colorscheme',
        desc_hl = 'String',
        key = 's',
        --keymap = 'SPC f d',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope colorscheme'
      },
    },
    footer = {}  --your footer
  }
})
