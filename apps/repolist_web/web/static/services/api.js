import { stringify } from 'qs';
import request from '../utils/request';

export default function queryRepositories(params) {
  return request(`/api/repositories?${stringify(params)}`);
}
