import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import {CategoryJumbotron} from "../../components/category-jumbotron";

export default class AddCategoryJumbotron extends Component {

  get showJumbotron() {
    return settings.plugin_outlet === "above-main-container";
  }

  <template>
    {{#if this.showJumbotron}}
      <CategoryJumbotron />
    {{/if}}
  </template>
}


