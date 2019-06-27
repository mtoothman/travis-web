import { isEmpty } from '@ember/utils';
import Component from '@ember/component';
import { computed } from '@ember/object';
import { reads } from '@ember/object/computed';

export default Component.extend({

  tagName: 'div',
  classNames: ['travistab'],

  didRender() {
    // Set the log to be default active tab unless something else is active
    if (isEmpty(this.$('.travistab-nav--secondary').find('.active'))) {
      this.$('#tab_log').addClass('active');
    }
  },

  noYaml: reads('job.build.request.noYaml'),

  tabTitle: computed('noYaml', function () {
    return this.noYaml ? null : 'Look at this job’s config';
  })
});
