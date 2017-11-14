---
# Remember, leave a key empty if there is no value.  None will be a string,
# not a Python "NoneType"
#
# Also remember that all examples have 'disable_action' set to True.  If you
# want to use this action as a template, be sure to set this to False after
# copying it.
actions:
  1:
    action: delete_indices
    description: >-
      Delete indices older than $ELASTICSEARCH_CLEANUP_OLDER_THAN_UNIT_COUNT $ELASTICSEARCH_CLEANUP_OLDER_THAN_UNIT (based on index name), for $ELASTICSEARCH_CLEANUP_INDICES_PREFIX
      prefixed indices. Ignore the error if the filter does not result in an
      actionable list of indices (ignore_empty_list) and exit cleanly.
    options:
      ignore_empty_list: True
      timeout_override:
      continue_if_exception: False
      disable_action: False
    filters:
    - filtertype: pattern
      kind: prefix
      value: $ELASTICSEARCH_CLEANUP_INDICES_PREFIX
      exclude:
    - filtertype: age
      source: name
      direction: older
      timestring: '%Y.%m.%d'
      unit: $ELASTICSEARCH_CLEANUP_OLDER_THAN_UNIT
      unit_count: $ELASTICSEARCH_CLEANUP_OLDER_THAN_UNIT_COUNT
      exclude:
