import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { fn } from "@ember/helper";
import { action } from "@ember/object";
import { LinkTo } from "@ember/routing";
import { service } from "@ember/service";
import { i18n } from "discourse-i18n";
import DButton from "discourse/components/d-button";
import DropdownMenu from "discourse/components/dropdown-menu";
import AdminConfigAreaEmptyList from "admin/components/admin-config-area-empty-list";
import WebhookItem from "admin/components/webhook-item";
import DMenu from "float-kit/components/d-menu";

export default class WebhooksList extends Component {
  @service router;

  @tracked webhooks = this.args.webhooks;

  constructor() {
    super(...arguments);
    console.log(this.webhooks.extras);
  }

  destroyWebhook() {
  }

  <template>
    <div class="container admin-api_keys">
      {{#if this.webhooks}}
        <table class="d-admin-table admin-web_hooks__items">
          <thead>
            <tr>
              <th>{{i18n "admin.web_hooks.delivery_status.title"}}</th>
              <th>{{i18n "admin.web_hooks.payload_url"}}</th>
              <th>{{i18n "admin.web_hooks.description_label"}}</th>
              <th>{{i18n "admin.web_hooks.controls"}}</th>
            </tr>
          </thead>
          <tbody>
            {{#each this.webhooks as |webhook|}}
              <WebhookItem @webhook={{webhook}} @deliveryStatuses={{this.webhooks.extras.delivery_statuses}} />
            {{/each}}
          </tbody>
        </table>
      {{else}}
        <AdminConfigAreaEmptyList
          @ctaLabel="admin.web_hooks.add"
          @ctaRoute="adminWebHooks.new"
          @ctaClass="admin-web_hooks__add-web_hook"
          @emptyLabel="admin.web_hooks.none"
        />
      {{/if}}
    </div>
  </template>
}
