local leap = require('leap')
leap.add_default_mappings()
leap.opts.case_sensitive = true
leap.opts.substitute_chars = { ['\r'] = '¬' }
leap.opts.special_keys.prev_target = { '<s-enter>', ',' }

leap.opts.highlight_unlabeled_phase_one_targets = false
leap.opts.max_highlighted_traversal_targets = 10
leap.opts.case_sensitive = false
leap.opts.equivalence_classes = { ' \t\r\n', }
leap.opts.substitute_chars = {}
leap.opts.safe_labels = { 's', 'f', 'n', 'u', 't'}
leap.opts.labels = { 's', 'f', 'n', 'j', 'k'}
leap.opts.special_keys = {
  next_target = '<enter>',
  prev_target = '<tab>',
  next_group = '<space>',
  prev_group = '<tab>',
  multi_accept = '<enter>',
  multi_revert = '<backspace>',
}
