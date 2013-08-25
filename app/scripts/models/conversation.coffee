Intimi.Conversation = DS.Model.extend
  interlocutor: DS.attr('string')

  account: DS.belongsTo('Intimi.MobileAccount')

  messages: DS.hasMany('Intimi.Message')
  surveys:  DS.hasMany('Intimi.Survey')

  latestMessage: (-> @get('messages.firstObject')).property('messages.@each')

  notRepliedSurveys: (->
    @get('surveys').filter (survey) -> Ember.empty(survey.get('attitude'))
  ).property('surveys.@each.attitude')
