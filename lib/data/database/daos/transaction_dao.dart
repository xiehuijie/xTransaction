import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'transaction_dao.g.dart';

/// 交易 DAO
@DriftAccessor(
  tables: [
    Transactions,
    TransactionMeta,
    TransactionAmountDetail,
    TransactionCountDetail,
    TransactionReduce,
    TransactionRefund,
    TransactionRelation,
  ],
)
class TransactionDao extends DatabaseAccessor<LedgerDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  // ==================== Transaction CRUD ====================

  /// 获取所有交易
  Future<List<TransactionEntity>> getAllTransactions() =>
      select(transactions).get();

  /// 根据ID获取交易
  Future<TransactionEntity?> getTransactionById(int id) => (select(
    transactions,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 根据ID列表获取交易
  Future<List<TransactionEntity>> getTransactionsByIds(List<int> ids) =>
      (select(transactions)..where((t) => t.id.isIn(ids))).get();

  /// 根据时间范围获取交易
  Future<List<TransactionEntity>> getTransactionsByDateRange(
    int startTimestamp,
    int endTimestamp,
  ) =>
      (select(transactions)
            ..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(startTimestamp) &
                  t.timestamp.isSmallerOrEqualValue(endTimestamp),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();


  /// 根据类型获取交易
  Future<List<TransactionEntity>> getTransactionsByType(
    TransactionType type,
  ) =>
      (select(transactions)
            ..where((t) => t.type.equalsValue(type))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();


  /// 获取最近的交易
  Future<List<TransactionEntity>> getRecentTransactions({int limit = 50}) =>
      (select(transactions)
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
            ..limit(limit))
          .get();

  /// 添加交易
  Future<int> insertTransaction(TransactionsCompanion entry) =>
      into(transactions).insert(entry);

  /// 更新交易
  Future<bool> updateTransaction(TransactionEntity entry) =>
      update(transactions).replace(entry);

  /// 删除交易
  Future<int> deleteTransaction(int id) =>
      (delete(transactions)..where((t) => t.id.equals(id))).go();

  /// 监听所有交易变化
  Stream<List<TransactionEntity>> watchAllTransactions() =>
      select(transactions).watch();

  /// 监听最近交易变化
  Stream<List<TransactionEntity>> watchRecentTransactions({int limit = 50}) =>
      (select(transactions)
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
            ..limit(limit))
          .watch();

  /// 监听特定日期范围交易变化
  Stream<List<TransactionEntity>> watchTransactionsByDateRange(
    int startTimestamp,
    int endTimestamp,
  ) =>
      (select(transactions)
            ..where(
              (t) =>
                  t.timestamp.isBiggerOrEqualValue(startTimestamp) &
                  t.timestamp.isSmallerOrEqualValue(endTimestamp),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .watch();

  // ==================== TransactionMeta CRUD ====================

  /// 获取交易的元数据
  Future<List<TransactionMetaEntity>> getTransactionMetas(
    int transactionId,
  ) => (select(
    transactionMeta,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 根据作用域获取交易元数据
  Future<List<TransactionMetaEntity>> getTransactionMetasByScope(
    int transactionId,
    TransactionMetaScope scope,
  ) => (select(transactionMeta)..where(
        (t) =>
            t.transactionId.equals(transactionId) & t.scope.equalsValue(scope),
      )).get();

  /// 获取特定交易元数据
  Future<TransactionMetaEntity?> getTransactionMetaByKey(
    int transactionId,
    TransactionMetaScope scope,
    String key,
  ) => (select(transactionMeta)..where(
        (t) =>
            t.transactionId.equals(transactionId) &
            t.scope.equalsValue(scope) &
            t.key.equals(key),
      )).getSingleOrNull();

  /// 添加或更新交易元数据
  Future<void> upsertTransactionMeta(TransactionMetaCompanion entry) =>
      into(transactionMeta).insertOnConflictUpdate(entry);

  /// 删除交易的所有元数据
  Future<int> deleteTransactionMetasByTransactionId(int transactionId) =>
      (delete(transactionMeta)
            ..where((t) => t.transactionId.equals(transactionId)))
          .go();

  /// 删除特定交易元数据
  Future<int> deleteTransactionMeta(
    int transactionId,
    TransactionMetaScope scope,
    String key,
  ) => (delete(transactionMeta)..where(
        (t) =>
            t.transactionId.equals(transactionId) &
            t.scope.equalsValue(scope) &
            t.key.equals(key),
      )).go();

  // ==================== TransactionAmountDetail CRUD ====================

  /// 获取交易的金额明细
  Future<List<TransactionAmountDetailEntity>> getAmountDetails(
    int transactionId,
  ) => (select(
    transactionAmountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 添加金额明细
  Future<int> insertAmountDetail(TransactionAmountDetailCompanion entry) =>
      into(transactionAmountDetail).insert(entry);

  /// 批量添加金额明细
  Future<void> insertAmountDetails(List<TransactionAmountDetailCompanion> entries) =>
      batch((batch) => batch.insertAll(transactionAmountDetail, entries));

  /// 更新金额明细
  Future<bool> updateAmountDetail(TransactionAmountDetailEntity entry) =>
      update(transactionAmountDetail).replace(entry);

  /// 删除交易的所有金额明细
  Future<int> deleteAmountDetailsByTransactionId(int transactionId) => (delete(
    transactionAmountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  /// 根据账户ID获取金额明细
  Future<List<TransactionAmountDetailEntity>> getAmountDetailsByAccountId(
    int accountId,
  ) => (select(
    transactionAmountDetail,
  )..where((t) => t.accountId.equals(accountId))).get();

  // ==================== TransactionCountDetail CRUD ====================

  /// 获取交易的数量明细
  Future<List<TransactionCountDetailEntity>> getCountDetails(
    int transactionId,
  ) => (select(
    transactionCountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 添加数量明细
  Future<int> insertCountDetail(TransactionCountDetailCompanion entry) =>
      into(transactionCountDetail).insert(entry);

  /// 批量添加数量明细
  Future<void> insertCountDetails(List<TransactionCountDetailCompanion> entries) =>
      batch((batch) => batch.insertAll(transactionCountDetail, entries));

  /// 更新数量明细
  Future<bool> updateCountDetail(TransactionCountDetailEntity entry) =>
      update(transactionCountDetail).replace(entry);

  /// 删除交易的所有数量明细
  Future<int> deleteCountDetailsByTransactionId(int transactionId) => (delete(
    transactionCountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  /// 根据分类ID获取数量明细
  Future<List<TransactionCountDetailEntity>> getCountDetailsByCategoryId(
    int categoryId,
  ) => (select(
    transactionCountDetail,
  )..where((t) => t.categoryId.equals(categoryId))).get();

  // ==================== TransactionReduce CRUD ====================

  /// 获取减免信息
  Future<TransactionReduceEntity?> getTransactionReduce(
    int transactionId,
  ) => (select(
    transactionReduce,
  )..where((t) => t.transactionId.equals(transactionId))).getSingleOrNull();

  /// 添加减免信息
  Future<void> insertTransactionReduce(TransactionReduceCompanion entry) =>
      into(transactionReduce).insert(entry);

  /// 更新减免信息
  Future<bool> updateTransactionReduce(TransactionReduceEntity entry) =>
      update(transactionReduce).replace(entry);

  /// 删除减免信息
  Future<int> deleteTransactionReduce(int transactionId) => (delete(
    transactionReduce,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  // ==================== TransactionRefund CRUD ====================

  /// 获取退款信息
  Future<List<TransactionRefundEntity>> getTransactionRefunds(
    int transactionId,
  ) => (select(
    transactionRefund,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 根据ID获取退款信息
  Future<TransactionRefundEntity?> getTransactionRefundById(int id) =>
      (select(transactionRefund)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 添加退款信息
  Future<int> insertTransactionRefund(TransactionRefundCompanion entry) =>
      into(transactionRefund).insert(entry);

  /// 更新退款信息
  Future<bool> updateTransactionRefund(TransactionRefundEntity entry) =>
      update(transactionRefund).replace(entry);

  /// 删除退款信息
  Future<int> deleteTransactionRefund(int id) =>
      (delete(transactionRefund)..where((t) => t.id.equals(id))).go();

  /// 删除交易的所有退款信息
  Future<int> deleteTransactionRefundsByTransactionId(int transactionId) => (delete(
    transactionRefund,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  // ==================== TransactionRelation CRUD ====================

  /// 获取交易关联
  Future<List<TransactionRelationEntity>> getTransactionRelations(
    int transactionId,
  ) => (select(transactionRelation)..where(
        (t) =>
            t.sourceTransactionId.equals(transactionId) |
            t.targetTransactionId.equals(transactionId),
      )).get();

  /// 获取特定类型的交易关联
  Future<List<TransactionRelationEntity>> getTransactionRelationsByType(
    int transactionId,
    TransactionRelationType type,
  ) => (select(transactionRelation)..where(
        (t) =>
            (t.sourceTransactionId.equals(transactionId) |
                t.targetTransactionId.equals(transactionId)) &
            t.type.equalsValue(type),
      )).get();

  /// 添加交易关联
  Future<int> insertTransactionRelation(TransactionRelationCompanion entry) =>
      into(transactionRelation).insert(entry);

  /// 删除交易关联
  Future<int> deleteTransactionRelation(
    int sourceId,
    int targetId,
    TransactionRelationType type,
  ) => (delete(transactionRelation)..where(
        (t) =>
            t.sourceTransactionId.equals(sourceId) &
            t.targetTransactionId.equals(targetId) &
            t.type.equalsValue(type),
      )).go();

  /// 删除交易的所有关联
  Future<int> deleteTransactionRelationsByTransactionId(int transactionId) =>
      (delete(transactionRelation)..where(
            (t) =>
                t.sourceTransactionId.equals(transactionId) |
                t.targetTransactionId.equals(transactionId),
          ))
          .go();

  // ==================== 复合查询 ====================

  /// 获取完整的交易信息（包含金额明细和数量明细）
  Future<Map<String, dynamic>> getFullTransaction(int transactionId) async {
    final tx = await getTransactionById(transactionId);
    if (tx == null) return {};

    final amountDetails = await getAmountDetails(transactionId);
    final countDetails = await getCountDetails(transactionId);
    final metas = await getTransactionMetas(transactionId);
    final reduce = await getTransactionReduce(transactionId);
    final refunds = await getTransactionRefunds(transactionId);
    final relations = await getTransactionRelations(transactionId);

    return {
      'transaction': tx,
      'amountDetails': amountDetails,
      'countDetails': countDetails,
      'metas': metas,
      'reduce': reduce,
      'refunds': refunds,
      'relations': relations,
    };
  }

  /// 删除完整的交易（包含所有关联数据）
  Future<void> deleteFullTransaction(int transactionId) async {
    await transaction(() async {
      await deleteTransactionRelationsByTransactionId(transactionId);
      await deleteTransactionRefundsByTransactionId(transactionId);
      await deleteTransactionReduce(transactionId);
      await deleteCountDetailsByTransactionId(transactionId);
      await deleteAmountDetailsByTransactionId(transactionId);
      await deleteTransactionMetasByTransactionId(transactionId);
      await deleteTransaction(transactionId);
    });
  }
}
