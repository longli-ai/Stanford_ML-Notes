## Week6

### 应用机器学习的建议

#### 评估学习算法

当你遇到模型不行的时候，怎样进行debug
- 收集更多的训练数据
    - 有时候不起作用
- 减少特征数量
    - 避免过拟合
- 增加更多的特征
- 增加特征多项式特征
- 增大正则化$\lambda$
- 减少正则化$\lambda$


#### 评估假设函数

数据集切分
- 将数据集切成两份，即训练集和测试集(7:3)
- 并且要切分前，要将数据集打散，防止数据有顺序

评估假设函数流程
- 线性回归
![线性回归](https://user-images.githubusercontent.com/41643043/56450041-55d5fa00-6354-11e9-9cee-83e1d4cc0d29.png)

- 分类算法
![逻辑回归](https://user-images.githubusercontent.com/41643043/56450042-566e9080-6354-11e9-9792-a8e22189765b.png)


模型选择
- degree of polynomial 重新看 
- cv的引入 重新看

训练集样本划分
- 训练集，交叉验证集，测试集(6:2:2)
- 训练误差，交叉验证误差，训练集误差


#### 偏差和方差

**误差和多形式度 (error-degree of polynomial d)**
![](https://user-images.githubusercontent.com/41643043/56450590-c9c6d100-6359-11e9-9517-0a08e443f184.png)

**方差和偏差判定**
![](https://user-images.githubusercontent.com/41643043/56450589-c92e3a80-6359-11e9-9bc3-242b52a4f19a.png)



正则化与方差和偏差
$error-\lambda$

![](https://user-images.githubusercontent.com/41643043/56451039-5ffbf680-635c-11e9-85fa-11245c42b0bf.png)

学习曲线
$error-m$

误差和样本数量图
![](https://user-images.githubusercontent.com/41643043/56451543-d0a41280-635e-11e9-8757-01089a400d37.png)

交叉验证误差和训练误差都很大
增加数据集没什么用
![](https://user-images.githubusercontent.com/41643043/56451544-d1d53f80-635e-11e9-9c48-7548ac8d8b88.png)

交叉验证和训练误差之间有一个很大的gap
增加数据集的数量，可以减少两者之间的gap
![](https://user-images.githubusercontent.com/41643043/56451548-d4379980-635e-11e9-95ec-9a4d96456927.png)


当你遇到模型不行的时候，怎样进行debug
- 收集更多的训练数据 (high variance)
    - 有时候不起作用
- 减少特征数量 (high variance)
    - 避免过拟合
- 增加更多的特征 (high bias)
- 增加特征多项式特征 (high bias)
- 增大正则化$\lambda$ (high bias)
- 减少正则化$\lambda$ (high variance)


神经网络的过拟合
![](https://user-images.githubusercontent.com/41643043/56452126-d5b69100-6361-11e9-8d96-f88954094e0a.png)

### 机器学习系统设计

垃圾邮件分类器
- 根据邮件单词创建特征向量
- 怎样花时间减少误差
    - 收集垃圾邮件
    - 识别路由信息
    - 合并相近的单词，比如 "discount" 和 "discounts"
    - 合并相近的单词，纠正错误写法，比如 "disc0unt" 和 "discount"，垃圾邮件让算法识别错误

推荐的系统设计
- 快速实施一个算法，并且用交叉验证测试
- 画出学习曲线，来识别是不是需要更多的样本，更多的特征
- **误差分析** 
    - 手工检查错误的样本
    - 说不定能找到一些特征，进一步改进系统



处理抖动数据


使用大数据集






