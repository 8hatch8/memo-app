<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}: {{ memo.content }}
      </li>
    </ul>
    <div>
      <input v-model="title" placeholder="title" />
      <input v-model="content" placeholder="content" />
      <button @click="addMemo">メモを追加</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      memos: [],
      title: "",
      content: "",
    };
  },
  methods: {
    setMemo() {
      axios.get("/api/memos").then((response) => {
        this.memos = response.data;
      });
    },
    addMemo() {
      axios
        .post("/api/memos", {
          title: this.title,
          content: this.content,
        })
        .then((response) => {
          this.setMemo();
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
