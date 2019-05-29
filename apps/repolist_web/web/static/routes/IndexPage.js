import React, { PureComponent } from 'react';
import { connect } from 'dva';
import { Avatar, Button, Card, Col, Descriptions, Form, Icon, Layout, List, Modal, PageHeader, Row, Select, Typography } from 'antd';
import ColorHash from 'color-hash';
import styles from './IndexPage.less';
import languages from '../utils/languages';

const FormItem = Form.Item;
const { Content, Footer } = Layout;
const Option = { Select };
const { Paragraph } = Typography;
const colorHash = new ColorHash('A');

@Form.create()
@connect(state => ({
  list: state.list,
}))
export default class IndexPage extends PureComponent {

  state = {
    detailItem: undefined,
    selectedLanguages: 0,
  }

  fetchResults = () => {
    const {
      form: {
        getFieldValue,
      } } = this.props;

    const languages = getFieldValue('language');

    this.props.dispatch({
      type: 'list/fetch',
      payload: {
        languages: languages
      },
    });
  }

  clear = () => {
    const {
      form,
      dispatch,
    } = this.props;

    this.setState({
      detailItem: undefined,
      selectedLanguages: 0,
    });

    form.resetFields();

    dispatch({
      type: 'list/reset'
    });

  }

  onLanguageSelected = (option) => {
    const { selectedLanguages } = this.state;

    this.setState({
      selectedLanguages: selectedLanguages + 1,
    });
  }

  onLanguageDeselected = (option) => {
    const { selectedLanguages } = this.state;

    this.setState({
      selectedLanguages: selectedLanguages - 1,
    });
  }

  showDetail = (item) => {
    console.log(item);
    this.setState({
      detailItem: item,
    })
  }

  hideDetail = () => {
    this.setState({
      detailItem: undefined,
    });
  }

  render() {
    const { list: { list, loading }, form } = this.props;
    const { getFieldDecorator } = form;
    const { selectedLanguages, detailItem } = this.state;

    const content = (
      <div className="content">
        <Paragraph>
          Uso: Selecione algumas linguagens no campo abaixo e clique em buscar para visualizar os repositórios de mais destaque (com mais estrelas) de cada linguagem.
        </Paragraph>
        <p className="contentLink">
          <a href="https://github.com/duartejc/list-repositories/blob/master/README.md">
            <img src="https://gw.alipayobjects.com/zos/rmsportal/NbuDUAuBlIApFuDvWiND.svg" alt="info" />
            Informações
          </a>
          <a href="https://github.com/duartejc/list-repositories/archive/master.zip">
            <img src="https://gw.alipayobjects.com/zos/rmsportal/ohOEPSYdDTNnyMbGuyLb.svg" alt="source" />
            Código fonte
          </a>
        </p>
      </div>
    );

    return (
      <Layout>
        <Layout>
          <Content>
            <PageHeader title="Repositórios destaques do GitHub">
              <div className="wrap">
                <div className="content">{content}</div>
              </div>
            </PageHeader>
            <div style={{padding: '20px'}}>
              <Card>
                <Row>
                  <Col lg={10} md={10} sm={10} xs={10}>
                    <FormItem className={styles.formItem}>
                      {getFieldDecorator('language', {
                        initialValue: [],
                        rules: [{
                          required: true,
                          message: 'Selecione as linguagens',
                        }]
                      })(
                        <Select
                          mode="multiple"
                          style={{ maxWidth: 500, width: '100%' }}
                          placeholder="Selecione as linguagens"
                          onSelect={this.onLanguageSelected}
                          onDeselect={this.onLanguageDeselected}
                        >
                          {
                            languages.map(language =>
                              <Option key={language.id} value={language.id}>{language.name}</Option>
                            )
                          }
                        </Select>
                      )}
                    </FormItem>
                  </Col>
                  <Col lg={6} md={6} sm={6} xs={6}>
                    <Button icon="search" type="primary" onClick={() => this.fetchResults()} disabled={selectedLanguages < 1} className={styles.searchButton} style={{marginRight: '6px'}}>Buscar</Button>
                    <Button icon="delete" onClick={this.clear}>Limpar</Button>
                  </Col>
                </Row>
              </Card>
              <List
                rowKey="id"
                loading={loading}
                grid={{ gutter: 24, lg: 3, md: 2, sm: 1, xs: 1 }}
                dataSource={[...list]}
                className={styles.list}
                style={{marginTop: '18px'}}
                renderItem={item => (
                  <List.Item key={item.id}>
                    <Card hoverable className={styles.card} actions={[<a onClick={() => this.showDetail(item)}>Detalhes</a>, <a href={item.html_url} target="_blank">Ver no GitHub</a>]}>
                      <Card.Meta
                        avatar={<Avatar style={{ backgroundColor: colorHash.hex(item.name), verticalAlign: 'middle' }} shape="circle" size="large">{item.name.charAt(0).toUpperCase()}</Avatar>}
                        title={<a href="#">{item.name}</a>}
                        description={(
                          <p className={styles.cardDescription}>
                            <span>{item.full_name}</span>
                          </p>
                        )}
                      />
                    </Card>
                  </List.Item>
                )}
              />
            </div>
            { detailItem && <Modal
              visible={detailItem}
              onOk={this.hideDetail}
              onCancel={this.hideDetail}
              width={600}
            >
              <Descriptions bordered title={detailItem.name} border size="small">
                <Descriptions.Item label="Full Name">{detailItem.full_name}</Descriptions.Item>
                <Descriptions.Item label="Public">{detailItem.private === true ? <Icon type="stop" theme="twoTone" twoToneColor="#f50" /> : <Icon type="check-circle" theme="twoTone" twoToneColor="#52c41a" /> }</Descriptions.Item>
                <Descriptions.Item label="License">{detailItem.license ? detailItem.license.name : ''}</Descriptions.Item>
                <Descriptions.Item label="Open issues"><Icon type="exclamation-circle" /> {detailItem.open_issues_count}</Descriptions.Item>
                <Descriptions.Item label="Stars"><Icon type="star" theme="filled" /> {detailItem.stargazers_count}</Descriptions.Item>
                <Descriptions.Item label="Watchers"><Icon type="eye" theme="filled" /> {detailItem.watchers_count}</Descriptions.Item>
                <Descriptions.Item label="Description">{detailItem.description}</Descriptions.Item>
              </Descriptions>
            </Modal>}
          </Content>
        </Layout>
        <Footer>Copyright © 2019 - Jean Duarte</Footer>
      </Layout>
    );
  }
}
