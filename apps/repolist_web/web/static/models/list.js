import queryRepositories from '../services/api';

module.exports = {
  namespace: 'list',

  state: {
    list: [],
    loading: false,
  },

  effects: {
    * fetch({ payload }, { call, put }) {
      yield put({
        type: 'changeLoading',
        payload: true,
      });
      const response = yield call(queryRepositories, payload);
      let data = [];
      if (response.data) {
        data = response.data.data;
      }

      yield put({
        type: 'setList',
        payload: data,
      });
      yield put({
        type: 'changeLoading',
        payload: false,
      });
    },

    * reset(_, { put }) {
      yield put({
        type: 'changeLoading',
        payload: true,
      });

      yield put({
        type: 'setList',
        payload: [],
      });
      yield put({
        type: 'changeLoading',
        payload: false,
      });
    },
  },

  reducers: {
    setList(state, action) {
      return {
        ...state,
        list: action.payload,
      };
    },
    changeLoading(state, action) {
      return {
        ...state,
        loading: action.payload,
      };
    },
  },
};
