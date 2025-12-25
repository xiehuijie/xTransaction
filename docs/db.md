# 式样设计

## 表设计

- ### 表结构定义

  > 前置说明
  >
  > - 特殊字段标识：
  >   - 🔑 主键
  >   - 🔍[x] 索引，x 表示索引组号
  >   - ❄️[x] 唯一，x 表示唯一约束组号
  >   - 🔗 外键，所有外键均遵循严格删除禁止的约定
  >   - 🔄 自增字段，数据库自动分配唯一的递增值
  >   - ℹ️ 枚举类型字段，使用`CHECK IN`约束
  >   - ❇️ 允许为空字段
  >   - 💰 金额型字段，以整数形式存储，按货币精度的最小单位存储（如人民币 2 位小数，97.63 存储为 9763）
  >   - 🕗 时间戳字段，以整数形式存储毫秒级别的 UNIX 时间戳
  >   - 📅 日期型字段，以整数形式存储 1900 日期系统天数
  >   - 🚩 布尔型字段，以整数形式存储，0 代表`false`，1 代表`true`

- #### 账户表 (Account) [account]

  用于描述基础的账户信息。

  | 字段名                       | 字段类型 | 描述         |
  | ---------------------------- | -------- | ------------ |
  | account_id 🔄🔑              | INTEGER  | 账户唯一标识 |
  | name ❄️[0]                   | TEXT     | 账户名称     |
  | description                  | TEXT     | 账户描述     |
  | icon                         | TEXT     | 账户图标     |
  | [type ℹ️](#accounttype)🔍[0] | TEXT     | 账户类型     |
  | currency_code 🔗             | TEXT     | 账户货币代码 |
  | created_at 🕗                | INTEGER  | 创建时间戳   |
  | updated_at 🕗                | INTEGER  | 更新时间戳   |
  | note                         | TEXT     | 备注         |

- #### 账户元数据表 (AccountMeta) [account_meta]

  存储账户的扩展元数据信息，采用键值对形式。

  | 字段名                          | 字段类型 | 描述               |
  | ------------------------------- | -------- | ------------------ |
  | account_id 🔑                   | INTEGER  | 关联的账户唯一标识 |
  | [scope ℹ️](#accountmetascope)🔑 | TEXT     | 元数据作用域       |
  | key 🔑                          | TEXT     | 元数据键           |
  | value                           | TEXT     | 元数据值           |

- #### 信用账户表 (CreditAccount) [account_credit]

  在基础账户表的基础上，扩展信用账户特有的信息。

  | 字段名            | 字段类型 | 描述               |
  | ----------------- | -------- | ------------------ |
  | account_id 🔑🔗   | INTEGER  | 关联的账户唯一标识 |
  | credit_limit 💰   | INTEGER  | 信用额度           |
  | billing_cycle_day | INTEGER  | 账单日（1~28）     |
  | payment_due_day   | INTEGER  | 还款日（1~28）     |

- #### 赠送金账户表 (BonusAccount) [account_bonus]

  在基础账户表的基础上，定义此赠送金账户与预付款账户的关联关系。

  | 字段名                  | 字段类型 | 描述                     |
  | ----------------------- | -------- | ------------------------ |
  | bonus_account_id 🔑🔗   | INTEGER  | 对应的赠送金账户唯一标识 |
  | prepaid_account_id 🔑🔗 | INTEGER  | 对应的预付款账户唯一标识 |

- #### 借贷账户表 (LoanAccount) [account_loan]

  在基础账户表的基础上，扩展借贷账户特有的信息。

  | 字段名                      | 字段类型 | 描述                     |
  | --------------------------- | -------- | ------------------------ |
  | account_id 🔑🔗             | INTEGER  | 关联的账户唯一标识       |
  | stakeholder_id 🔗🔍[0]      | INTEGER  | 关联的相关方唯一标识     |
  | [type ℹ️](#accountloantype) | TEXT     | 借贷类型                 |
  | amount 💰                   | INTEGER  | 借贷金额                 |
  | rate                        | INTEGER  | 年化利率（基点，5%=500） |
  | start_date 📅               | INTEGER  | 借贷开始日期             |
  | end_date 📅🔍[1]            | INTEGER  | 借贷结束日期             |
  | archived 🚩🔍[2]            | INTEGER  | 是否归档                 |
  | note                        | TEXT     | 备注                     |

- #### 借贷计划表 (LoanPlan) [loan_plan]

  定义借贷账户的还款/收款计划。

  | 字段名             | 字段类型 | 描述               |
  | ------------------ | -------- | ------------------ |
  | loan_plan_id 🔄🔑  | INTEGER  | 计划唯一标识       |
  | account_id 🔗🔍[0] | INTEGER  | 关联的账户唯一标识 |
  | amount 💰          | INTEGER  | 计划金额           |
  | due_date 📅🔍[0]   | INTEGER  | 到期日期           |
  | created_at 🕗      | INTEGER  | 创建时间戳         |
  | updated_at 🕗      | INTEGER  | 更新时间戳         |
  | note               | TEXT     | 备注               |

- #### 借贷实况表 (LoanRecord) [loan_record]

  记录借贷账户的每次还款/收款实况。

  | 字段名              | 字段类型 | 描述               |
  | ------------------- | -------- | ------------------ |
  | loan_record_id 🔄🔑 | INTEGER  | 实况唯一标识       |
  | account_id 🔗 🔍[0] | INTEGER  | 关联的账户唯一标识 |
  | amount 💰           | INTEGER  | 实际金额           |
  | timestamp 🕗🔍[0]   | INTEGER  | 实际发生时间戳     |
  | created_at 🕗       | INTEGER  | 创建时间戳         |
  | updated_at 🕗       | INTEGER  | 更新时间戳         |
  | note                | TEXT     | 备注               |

- #### 投资账户表 (InvestAccount) [account_invest]

  在基础账户表的基础上，扩展投资账户特有的信息。

  | 字段名          | 字段类型 | 描述               |
  | --------------- | -------- | ------------------ |
  | account_id 🔑🔗 | INTEGER  | 关联的账户唯一标识 |

- #### 账本表 (Ledger) [ledger]

  用于描述账本信息，不同账本下的分类、账户、相关方将被认为是不同的实体，一切的记账活动均基于某个账本进行，例如账户余额统计、消费统计汇总等。

  | 字段名           | 字段类型 | 描述                 |
  | ---------------- | -------- | -------------------- |
  | ledger_id 🔄🔑   | INTEGER  | 账本唯一标识         |
  | name ❄️[0]       | TEXT     | 账本名称             |
  | currency_code 🔗 | TEXT     | 账本货币本币代码     |
  | description      | TEXT     | 账本描述             |
  | photo            | TEXT     | 账本封面             |
  | auto_account 🚩  | INTEGER  | 是否自动包含新增账户 |
  | auto_category 🚩 | INTEGER  | 是否自动包含新增分类 |
  | created_at 🕗    | INTEGER  | 创建时间戳           |
  | updated_at 🕗    | INTEGER  | 更新时间戳           |
  | note             | TEXT     | 备注                 |

- #### 账户账本关联表 (LedgerAccountRelation) [relation_account_ledger]

  定义账户与账本的关联关系。存在此表即表示某账户属于某账本。当账本的`auto_account`字段为真时，新增账户会自动添加到此账本中。

  | 字段名          | 字段类型 | 描述               |
  | --------------- | -------- | ------------------ |
  | account_id 🔑🔗 | INTEGER  | 关联的账户唯一标识 |
  | ledger_id 🔑🔗  | INTEGER  | 关联的账本唯一标识 |

- #### 项目表 (Project) [project]

  记录项目相关的信息，项目可用于对交易进行归类和预算管理。项目所属于某个账本。项目的名称在同一账本下需唯一。

  | 字段名                 | 字段类型 | 描述               |
  | ---------------------- | -------- | ------------------ |
  | project_id 🔄🔑        | INTEGER  | 项目唯一标识       |
  | ledger_id 🔗❄️[0]🔍[0] | INTEGER  | 关联的账本唯一标识 |
  | name ❄️[0]             | TEXT     | 项目名称           |
  | description            | TEXT     | 项目描述           |
  | budget 💰              | INTEGER  | 项目预算           |
  | icon                   | TEXT     | 项目图标           |
  | archived 🚩🔍[1]       | INTEGER  | 是否归档           |
  | created_at 🕗          | INTEGER  | 创建时间戳         |
  | updated_at 🕗          | INTEGER  | 更新时间戳         |
  | start_date 📅          | INTEGER  | 项目开始日期       |
  | end_date 📅            | INTEGER  | 项目结束日期       |

- #### 货币表 (Currency) [currency]

  记录系统支持的货币信息，除了系统内置货币外，用户还可以自定义货币，但主要用于储值型账户。

  | 字段名                           | 字段类型 | 描述               |
  | -------------------------------- | -------- | ------------------ |
  | currency_code 🔑                 | TEXT     | 货币代码（如 USD） |
  | name                             | TEXT     | 货币名称           |
  | symbol                           | TEXT     | 货币符号（如$）    |
  | [position ℹ️](#currencyposition) | TEXT     | 货币符号位置       |
  | decimal                          | INTEGER  | 小数位数           |
  | icon                             | TEXT     | 货币图标           |
  | [source ℹ️](#currencysource)     | TEXT     | 货币来源           |

- #### 分类表 (Category) [category]

  记录交易分类信息，用于对交易进行分类管理。支持多级分类结构。在每一种分类类型下，分类名称需唯一。

  | 字段名                             | 字段类型 | 描述             |
  | ---------------------------------- | -------- | ---------------- |
  | category_id 🔄🔑                   | INTEGER  | 分类唯一标识     |
  | parent_id 🔗❇️🔍[0]                | INTEGER  | 父级分类唯一标识 |
  | name ❄️[0]                         | TEXT     | 分类名称         |
  | [type ℹ️](#categorytype)❄️[0]🔍[0] | TEXT     | 分类类型         |
  | icon                               | TEXT     | 分类图标         |
  | order                              | INTEGER  | 分类排序值       |

- #### 分类账本关联表 (LedgerCategoryRelation) [relation_category_ledger]

  定义分类与账本的关联关系。当账本的`auto_category`字段为真时，新增分类会自动添加到此账本中。

  | 字段名           | 字段类型 | 描述               |
  | ---------------- | -------- | ------------------ |
  | category_id 🔑🔗 | INTEGER  | 关联的分类唯一标识 |
  | ledger_id 🔑🔗   | INTEGER  | 关联的账本唯一标识 |

- #### 相关方表 (Stakeholder) [stakeholder]

  用于描述参与交易相关的人员、商户、企业、实体等对象。

  | 字段名                           | 字段类型 | 描述           |
  | -------------------------------- | -------- | -------------- |
  | stakeholder_id 🔄🔑              | INTEGER  | 相关方唯一标识 |
  | name                             | TEXT     | 相关方名称     |
  | [type ℹ️](#stakeholdertype)🔍[0] | TEXT     | 相关方类型     |
  | avatar                           | TEXT     | 相关方头像     |
  | description                      | TEXT     | 相关方描述     |
  | contact                          | TEXT     | 联系方式       |
  | created_at 🕗                    | INTEGER  | 创建时间戳     |
  | updated_at 🕗                    | INTEGER  | 更新时间戳     |
  | note                             | TEXT     | 备注           |

- #### 交易表 (Transaction) [transaction]

  用于记录每一笔交易（支出、收入）的信息。

  | 字段名                           | 字段类型 | 描述                       |
  | -------------------------------- | -------- | -------------------------- |
  | transaction_id 🔄🔑              | INTEGER  | 交易唯一标识               |
  | ledger_id 🔗🔍[0]                | INTEGER  | 关联的账本唯一标识         |
  | [type ℹ️](#transactiontype)🔍[1] | TEXT     | 交易类型（支出/收入/转账） |
  | timestamp 🕗🔍[2]                | INTEGER  | 交易时间戳                 |
  | created_at 🕗                    | INTEGER  | 创建时间戳                 |
  | updated_at 🕗                    | INTEGER  | 更新时间戳                 |
  | stakeholder_id 🔗 ❇️🔍[3]        | INTEGER  | 关联的相关方唯一标识       |
  | hidden 🚩🔍[4]                   | INTEGER  | 交易是否可见               |
  | excluded 🚩🔍[5]                 | INTEGER  | 是否不计入收支             |
  | location_name ❇️                 | TEXT     | 交易地点名称               |
  | location_lat ❇️                  | REAL     | 交易地点纬度               |
  | location_lng ❇️                  | REAL     | 交易地点经度               |
  | note                             | TEXT     | 交易备注                   |

- #### 交易金额明细表 (TransactionAmountDetail) [transaction_amount_detail]

  记录某笔交易中各账户的具体金额变动明细，仅涉及账户层面的金额变化。

  | 字段名                 | 字段类型 | 描述                 |
  | ---------------------- | -------- | -------------------- |
  | amount_detail_id 🔄🔑  | INTEGER  | 金额明细唯一标识     |
  | transaction_id 🔗🔍[0] | INTEGER  | 所属交易的唯一标识   |
  | account_id 🔗🔍[1]     | INTEGER  | 关联的账户唯一标识   |
  | currency_code 🔗       | TEXT     | 交易时货币代码       |
  | amount 💰              | INTEGER  | 交易时金额（交易币） |
  | real_amount 💰         | INTEGER  | 实际交易金额（本币） |

- #### 交易分类明细表 (TransactionCategoryDetail) [transaction_category_detail]

  记录某笔交易的分类信息及权重分配，支持一笔交易分配到多个分类。

  | 字段名                  | 字段类型 | 描述                 |
  | ----------------------- | -------- | -------------------- |
  | category_detail_id 🔄🔑 | INTEGER  | 分类明细唯一标识     |
  | transaction_id 🔗🔍[0]  | INTEGER  | 所属交易的唯一标识   |
  | category_id 🔗🔍[1]     | INTEGER  | 关联的分类唯一标识   |
  | currency_code 🔗        | TEXT     | 交易时货币代码       |
  | amount 💰               | INTEGER  | 交易时金额（交易币） |
  | real_amount 💰          | INTEGER  | 实际交易金额（本币） |

- #### 交易分期计划表 (TransactionInstallmentDetail) [transaction_installment_detail]

  记录交易分期的计划元数据信息。

  | 字段名                     | 字段类型 | 描述               |
  | -------------------------- | -------- | ------------------ |
  | installment_detail_id 🔄🔑 | INTEGER  | 分期计划唯一标识   |
  | transaction_id 🔗🔍[0]     | INTEGER  | 所属交易的唯一标识 |
  | account_id 🔗🔍[1]         | INTEGER  | 关联的账户唯一标识 |
  | currency_code 🔗           | TEXT     | 分期时货币代码     |

- #### 交易分期明细表 (TransactionInstallmentItem) [transaction_installment_item]

  记录分期计划中各分期的具体明细，仅包含期次相关信息。

  | 字段名                        | 字段类型 | 描述                   |
  | ----------------------------- | -------- | ---------------------- |
  | installment_item_id 🔄🔑      | INTEGER  | 分期明细唯一标识       |
  | installment_detail_id 🔗🔍[0] | INTEGER  | 分期计划唯一标识       |
  | installment_number 🔍[1]      | INTEGER  | 分期编号（从 1 开始）  |
  | due_date 📅🔍[2]              | INTEGER  | 分期到期日期           |
  | capital_amount 💰             | INTEGER  | 本期本金金额（交易币） |
  | real_capital_amount 💰        | INTEGER  | 本期本金金额（本币）   |
  | interest_amount 💰            | INTEGER  | 本期利息金额（交易币） |
  | real_interest_amount 💰       | INTEGER  | 本期利息金额（本币）   |

- #### 交易减免表 (TransactionReduce) [transaction_deduce]

  记录某笔交易发生减免时的相关信息。`amount`永为正数，具体取决于原交易的方向（与之相反）。支出时一般为折扣、优惠等；收入时一般为纳税、手续费等；转帐中不存在此类型数据。

  | 字段名                     | 字段类型 | 描述                 |
  | -------------------------- | -------- | -------------------- |
  | transaction_reduce_id 🔄🔑 | INTEGER  | 交易减值唯一标识     |
  | transaction_id 🔗🔍[0]     | INTEGER  | 所属交易的唯一标识   |
  | category_id 🔗             | INTEGER  | 关联的分类唯一标识   |
  | currency_code 🔗           | TEXT     | 减免时货币代码       |
  | amount 💰                  | INTEGER  | 减值时金额（交易币） |
  | real_amount 💰             | INTEGER  | 实际减值金额（本币） |

- #### 交易退款表 (TransactionRefund) [transaction_refund]

  记录某笔支出交易发生退款时的相关信息。`amount`永为正数，具体取决于原交易的方向（与之相反）。转账中不存在此类型数据。

  | 字段名                     | 字段类型 | 描述                 |
  | -------------------------- | -------- | -------------------- |
  | transaction_refund_id 🔄🔑 | INTEGER  | 交易退款唯一标识     |
  | transaction_id 🔗🔍[0]     | INTEGER  | 所属交易的唯一标识   |
  | account_id 🔗🔍[1]         | INTEGER  | 关联的账户唯一标识   |
  | currency_code 🔗           | TEXT     | 退款时货币代码       |
  | amount 💰                  | INTEGER  | 退款时金额（交易币） |
  | real_amount 💰             | INTEGER  | 实际退款金额（本币） |
  | timestamp 🕗🔍[0]          | INTEGER  | 退款时间戳           |
  | created_at 🕗              | INTEGER  | 创建时间戳           |
  | updated_at 🕗              | INTEGER  | 更新时间戳           |
  | note                       | TEXT     | 退款备注             |

- #### 交易与项目关联表 (TransactionProjectRelation) [relation_project_transaction]

  定义交易与项目的关联关系。

  | 字段名              | 字段类型 | 描述               |
  | ------------------- | -------- | ------------------ |
  | transaction_id 🔑🔗 | INTEGER  | 关联的交易唯一标识 |
  | project_id 🔑🔗     | INTEGER  | 关联的项目唯一标识 |

- #### 交易关联表 (TransactionRelation) [relation_transaction]

  用于记录交易之间的关联关系。

  | 字段名                              | 字段类型 | 描述                   |
  | ----------------------------------- | -------- | ---------------------- |
  | target_transaction_id 🔑🔗          | INTEGER  | 关联的目标交易唯一标识 |
  | source_transaction_id 🔑🔗          | INTEGER  | 关联的源交易唯一标识   |
  | [type ℹ️](#transactionrelationtype) | TEXT     | 关联关系类型           |

- #### 报销计划表 (Reimbursement) [reimbursement]

  记录报销计划的基本信息。记录在报销计划中的金额（非存档记录）将不会被计入日常收支统计中。

  已归档的报销记录按照实际到账金额进行统计，未归档的报销记录按照预期金额进行统计。

  | 字段名                | 字段类型 | 描述               |
  | --------------------- | -------- | ------------------ |
  | reimbursement_id 🔄🔑 | INTEGER  | 报销唯一标识       |
  | transaction_id 🔗     | INTEGER  | 关联的交易唯一标识 |
  | archived 🚩🔍[0]      | INTEGER  | 是否归档           |
  | created_at 🕗         | INTEGER  | 创建时间戳         |
  | updated_at 🕗         | INTEGER  | 更新时间戳         |

- #### 报销预期表 (ReimbursementExpectation) [reimbursement_expectation]

  记录报销计划中的各个预期报销项。

  | 字段名                            | 字段类型 | 描述                   |
  | --------------------------------- | -------- | ---------------------- |
  | reimbursement_expectation_id 🔄🔑 | INTEGER  | 报销预期项唯一标识     |
  | reimbursement_id 🔗 🔍[0]         | INTEGER  | 关联的报销唯一标识     |
  | currency_code 🔗                  | TEXT     | 对应货币代码           |
  | stakeholder_id 🔗 ❇️🔍[3]         | INTEGER  | 关联的相关方唯一标识   |
  | amount 💰                         | INTEGER  | 预计报销金额（交易币） |
  | real_amount 💰                    | INTEGER  | 预计报销金额（本币）   |
  | note                              | TEXT     | 备注                   |

- #### 报销实际表 (ReimbursementActual) [reimbursement_actual]

  记录实际报销到账的具体明细。

  | 字段名                       | 字段类型 | 描述                   |
  | ---------------------------- | -------- | ---------------------- |
  | reimbursement_actual_id 🔄🔑 | INTEGER  | 实际报销项唯一标识     |
  | reimbursement_id 🔗 🔍[0]    | INTEGER  | 关联的报销唯一标识     |
  | account_id 🔗                | INTEGER  | 关联的账户唯一标识     |
  | currency_code 🔗             | TEXT     | 报销时的货币代码       |
  | amount 💰                    | INTEGER  | 实际报销金额（交易币） |
  | real_amount 💰               | INTEGER  | 实际报销金额（本币）   |
  | timestamp 🕗                 | INTEGER  | 报销到账时间戳         |
  | created_at 🕗                | INTEGER  | 创建时间戳             |
  | updated_at 🕗                | INTEGER  | 更新时间戳             |
  | note                         | TEXT     | 备注                   |

- ### 枚举说明

- #### AccountType

  账户类型。不同账户类型具有不同的属性和行为。

  - `balance` 余额账户
  - `credit` 信用账户
  - `loan` 借贷账户
  - `invest` 投资账户
  - `prepaid` 预付账户
  - `bonus` 赠送金账户

- #### AccountMetaScope

  - `system` 系统级元数据
  - `custom` 用户自定义元数据

- #### AccountBonusMode

  赠送金账户扣减方式。

  - `first` 优先使用
  - `last` 最后使用
  - `same` 等比例扣减

- #### AccountLoanType

  - `lend` 借出
  - `borrow` 借入

- #### CurrencySource

  - `system` 系统内置货币
  - `custom` 用户自定义货币

- #### CurrencyPosition

  - `prefix` 货币符号在金额前面
  - `suffix` 货币符号在金额后面

- #### CategoryType

  - `expense` 支出
  - `income` 收入
  - `discount` 折扣/优惠，适用于支出型交易的 Reduce 部分
  - `cost` 税收/手续费，适用于收入型交易的 Reduce 部分

- #### CategoryScope

  - `inner` 内置分类，分类管理中不可见，id 从`-1`开始递减
  - `global` 全局分类
  - `local` 局部限定分类

- #### StakeholderType

  - `person` 个人
  - `merchant` 商户
  - `company` 公司/企业
  - `other` 其他实体

- #### TransactionType

  - `expense` 支出
  - `income` 收入
  - `transfer` 转账

- #### TransactionRelationType

  表明源交易与目标交易之间的关联关系类型。

  - `afterwards` 后续交易
  - `forwards` 前置交易
  - `children` 子交易
  - `parent` 父交易
  - `related` 存在某种关联，但不属于上述之一
