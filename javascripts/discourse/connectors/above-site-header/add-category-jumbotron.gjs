import Component from "@glimmer/component";
import { CategoryJumbotron } from "../../components/category-jumbotron";

export default class AddCategoryJumbotron extends Component {
  get showJumbotron() {
    return settings.plugin_outlet === "above-site-header";
  }

  <template>
    {{#if this.showJumbotron}}
      <CategoryJumbotron />
    {{/if}}
  </template>
}
