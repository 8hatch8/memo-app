<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.content }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      memos: [],
    };
  },
  methods: {
    setMemo() {
      axios.get("/api/memos").then((response) => {
        this.memos = response.data;
      });
    },
  },
  // 読み込み時に実行
  mounted() {
    this.setMemo();
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
