<template>
  <div id="app">
     <div class="form">
      <div class="form-group">
         <input v-model="title" placeholder="title" class="form-control">
      </div>
      <div class="form-group">
        <input v-model="description" placeholder="description" class="form-control">
      </div>
      <button @click="addMemo">メモを追加する</button>
    </div>
    <div class="flex">
      <div v-for='memo in memos' :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
            {{ memo.title }}
          </div>
          {{ memo.description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      message: 'hi',
      memos: "memos"
    }
  },
  mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
      ))
    },
    addMemo: function() {
      axios.post('/api/memos',{
        title: this.title,
        description: this.description
      })
      .then(response =>(
        this.setMemo()
      ));
    }
   }

}

</script>


<style lang="scss" scoped>
.form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin: 32px;
  &-group {
    margin-bottom: 1rem;
  }
  &-control{
    width: 600px;
    min-height: 24px;
    font-size: 1rem;
    border: 1px solid #ced4da;
    padding: 4px 8px;
  }
}
button {
  width: 200px;
}

.flex {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.card {
  width:238px;
  border: 1px solid rgba(0,0,0,.125);
  border-radius: .25rem;
  margin: 16px;
  &-body {
    padding: 1.25rem;
  }
  &-title {
    margin-bottom: .75rem;
    font-weight: 600;
  }
}
</style>