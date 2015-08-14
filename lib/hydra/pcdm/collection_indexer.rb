module Hydra::PCDM
  class CollectionIndexer < ObjectIndexer
    def generate_solr_document
      super.tap do |solr_doc|
        solr_doc['member_ids_ssim']           = object.member_ids
        solr_doc['child_collection_ids_ssim'] = object.child_collection_ids
      end
    end
  end
end
